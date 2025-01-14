import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

import '../models/media_item_model.dart';
import '../models/media_playlist_model.dart';
import '../models/saavn_model.dart';
import '../models/yt_music_model.dart';
import '../presentation/route/global_str_consts.dart';
import '../repository/Saavn/saavn_api.dart';
import '../repository/Youtube/yt_music_api.dart';
import '../utils/global_const.dart';
import 'app_database_service.dart';
import 'snack_bar_service.dart';
import 'ytbg_service.dart';

List<int> generateRandomIndices(int length) {
  List<int> indices = List<int>.generate(length, (i) => i);
  indices.shuffle();
  return indices;
}

class AppMusicPlayer extends BaseAudioHandler with SeekHandler, QueueHandler {
  AudioPlayer audioPlayer = AudioPlayer(
    handleInterruptions: true,
  );
  BehaviorSubject<bool> fromPlaylist = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> isOffline = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> isLinkProcessing = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> shuffleMode = BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<List<MediaItem>> relatedSongs = BehaviorSubject<List<MediaItem>>.seeded([]);
  BehaviorSubject<LoopMode> loopMode = BehaviorSubject<LoopMode>.seeded(LoopMode.off);
  int currentPlayingIdx = 0;
  int shuffleIdx = 0;
  List<int> shuffleList = [];

  bool isPaused = false;

  final ReceivePort receivePortYt = ReceivePort();
  SendPort? sendPortYt;

  AppMusicPlayer() {
    initBgYt();
    audioPlayer.setVolume(1);
    audioPlayer.playbackEventStream.listen(_broadcastPlayerEvent);
    audioPlayer.setLoopMode(LoopMode.off);
  }

  void initBgYt() async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(
      ServicesBinding.rootIsolateToken!,
    );
    final appDocPath = (await getApplicationDocumentsDirectory()).path;
    final appSuppPath = (await getApplicationSupportDirectory()).path;

    receivePortYt.listen(
      (data) {
        if (data is SendPort) {
          sendPortYt = data;
        }

        if (data is Map) {
          if (data["link"] != null) {
            final audioSource = AudioSource.uri(Uri.parse(data["link"]));
            playAudioSource(audioSource: audioSource, mediaId: data["mediaId"]);
          } else {
            log("Link not found for vidId: ${data["id"]}", name: "bloomeePlayer");
            SnackBarService.showMessage("Link not found for vidId: ${data["id"]}");
          }
        }
      },
    );

    await Isolate.spawn(
      ytbgIsolate,
      [
        appDocPath,
        appSuppPath,
        receivePortYt.sendPort,
      ],
    );
  }

  void _broadcastPlayerEvent(PlaybackEvent event) {
    bool isPlaying = audioPlayer.playing;
    playbackState.add(PlaybackState(
      controls: [
        MediaControl.skipToPrevious,
        isPlaying ? MediaControl.pause : MediaControl.play,
        MediaControl.skipToNext,
      ],
      processingState: switch (event.processingState) {
        ProcessingState.idle => AudioProcessingState.idle,
        ProcessingState.loading => AudioProcessingState.loading,
        ProcessingState.buffering => AudioProcessingState.buffering,
        ProcessingState.ready => AudioProcessingState.ready,
        ProcessingState.completed => AudioProcessingState.completed,
      },
      systemActions: const {
        MediaAction.skipToPrevious,
        MediaAction.playPause,
        MediaAction.skipToNext,
        MediaAction.seek,
      },
      androidCompactActionIndices: const [0, 1, 2],
      updatePosition: audioPlayer.position,
      playing: isPlaying,
      bufferedPosition: audioPlayer.bufferedPosition,
      speed: audioPlayer.speed,
      // playing: audioPlayer.playerState.playing,
    ));
  }

  MediaItemModel get currentMedia => queue.value.isNotEmpty
      ? mediaItem2MediaItemModel(
          queue.value[currentPlayingIdx],
        )
      : mediaItemModelNull;

  @override
  Future<void> play() async {
    if (isLinkProcessing.value == false) {
      await audioPlayer.play();
      isPaused = false;
    } else {
      SnackBarService.showMessage("Link is in process...");
    }
  }

  Future<void> check4RelatedSongs() async {
    if (queue.value.isNotEmpty && (queue.value.length - currentPlayingIdx) < 2 && loopMode.value != LoopMode.all) {
      if (currentMedia.extras?["source"] == "saavn") {
        final songs = await compute(SaavnAPI.getRelated, currentMedia.id);
        if (songs['total'] > 0) {
          final List<MediaItem> temp = fromSaavnSongMapList2MediaItemList(songs['songs']);
          relatedSongs.add(temp.sublist(1));
          log("Related Songs: ${songs['total']}");
        }
      } else if (currentMedia.extras?["source"].contains("youtube") ?? false) {
        final songs = await compute(YtMusicService().getRelated, currentMedia.id.replaceAll('youtube', ''));
        if (songs['total'] > 0) {
          final List<MediaItem> temp = fromYtSongMapList2MediaItemList(songs['songs']);
          relatedSongs.add(temp.sublist(1));
          log("Related Songs: ${songs['total']}");
        }
      }
    }
  }

  Future<void> loadRelatedSongs() async {
    if (relatedSongs.value.isNotEmpty &&
        (queue.value.length - currentPlayingIdx) < 3 &&
        loopMode.value != LoopMode.all) {
      await addQueueItems(relatedSongs.value, atLast: true);
      fromPlaylist.add(false);
      relatedSongs.add([]);
    }
  }

  @override
  Future<void> seek(Duration position) async {
    audioPlayer.seek(position);
  }

  Future<void> seekNSecForward(Duration n) async {
    if ((audioPlayer.duration ?? const Duration(seconds: 0)) >= audioPlayer.position + n) {
      await audioPlayer.seek(audioPlayer.position + n);
    } else {
      await audioPlayer.seek(audioPlayer.duration ?? const Duration(seconds: 0));
    }
  }

  Future<void> seekNSecBackward(Duration n) async {
    if (audioPlayer.position - n >= const Duration(seconds: 0)) {
      await audioPlayer.seek(audioPlayer.position - n);
    } else {
      await audioPlayer.seek(const Duration(seconds: 0));
    }
  }

  @override
  Future<void> updateMediaItem(MediaItem mediaItem) async {
    super.mediaItem.add(mediaItem);
  }

  void setLoopMode(LoopMode loopMode) {
    if (loopMode == LoopMode.one) {
      audioPlayer.setLoopMode(LoopMode.one);
    } else {
      audioPlayer.setLoopMode(LoopMode.off);
    }
    this.loopMode.add(loopMode);
  }

  Future<void> shuffle(bool shuffle) async {
    shuffleMode.add(shuffle);
    if (shuffle) {
      shuffleIdx = 0;
      shuffleList = generateRandomIndices(queue.value.length);
    }
  }

  Future<void> loadPlaylist(
    MediaPlaylist mediaList, {
    int idx = 0,
    bool doPlay = false,
    bool shuffling = false,
  }) async {
    fromPlaylist.add(true);
    queue.add([]);
    relatedSongs.add([]);
    queue.add(mediaList.mediaItems);
    queueTitle.add(mediaList.playlistName);
    shuffle(shuffling);
    if (shuffling) {
      await prepare4play(idx: shuffleList[shuffleIdx], doPlay: doPlay);
    } else {
      await prepare4play(idx: idx, doPlay: doPlay);
    }
    // if (doPlay) play();
  }

  @override
  Future<void> pause() async {
    await audioPlayer.pause();
    isPaused = true;
  }

  Future<String?> latestYtLink({required String id, required String mediaId}) async {
    final vidInfo = await AppDatabaseService.getYtLinkCache(id);
    if (vidInfo != null) {
      if ((DateTime.now().millisecondsSinceEpoch ~/ 1000) + 350 > vidInfo.expireAt) {
        log("Link expired for vidId: $id", name: "AppPlayer");
        refreshYtLink(id: id, mediaId: mediaId);
      } else {
        log("Link found in cache for vidId: $id", name: "AppPlayer");
        String kurl = vidInfo.lowQURL!;
        // await BloomeeDBService.getSettingStr(GlobalStrConsts.ytStrmQuality)
        //     .then((value) {
        //   log("Play quality: $value", name: "bloomeePlayer");
        //   if (value != null) {
        //     if (value == "High") {
        //       kurl = vidInfo.highQURL;
        //     } else {
        //       kurl = vidInfo.lowQURL!;
        //     }
        //   }
        // });
        return kurl;
      }
    } else {
      log("No cache found for vidId: $id", name: "AppPlayer");
      refreshYtLink(id: id, mediaId: mediaId);
    }
    return null;
  }

  Future<void> refreshYtLink({required String id, required String mediaId}) async {
    // String quality = "Low";
    await AppDatabaseService.getSettingStr(GlobalStrConsts.ytStrmQuality).then((value) {
      log('Play quality: $value', name: "AppPlayer");
    });

    sendPortYt?.send(
      {
        "mediaId": mediaId,
        "id": id,
        "quality": "Low",
      },
    );
  }

  Future<AudioSource?> getAudioSource(MediaItem mediaItem) async {
    final _down = await AppDatabaseService.getDownloadDB(mediaItem2MediaItemModel(mediaItem));
    if (_down != null) {
      log("Playing Offline", name: "AppPlayer");
      SnackBarService.showMessage("Playing Offline", duration: const Duration(seconds: 1));
      isOffline.add(true);
      return AudioSource.uri(
        Uri.file('${_down.filePath}/${_down.fileName}'),
      );
    } else {
      isOffline.add(false);
      log("Playing online", name: "bloomeePlayer");
      if (mediaItem.extras?["source"] == "youtube") {
        final id = mediaItem.id.replaceAll("youtube", '');
        final tempStrmLink = await latestYtLink(id: id, mediaId: mediaItem.id);
        if (tempStrmLink != null) {
          return AudioSource.uri(Uri.parse(tempStrmLink));
        } else {
          return null;
        }
      }
      String? kurl = await getJsQualityURL(mediaItem.extras?["url"]);
      return AudioSource.uri(
        Uri.parse(kurl!),
      );
    }
  }

  @override
  Future<void> skipToQueueItem(int index) async {
    if (index < queue.value.length) {
      currentPlayingIdx = index;
      await playMediaItem(queue.value[index]);
    } else {
      await loadRelatedSongs();
      if (index < queue.value.length) {
        currentPlayingIdx = index;
        await playMediaItem(queue.value[index]);
      }
    }

    log("skipToQueueItem", name: "bloomeePlayer");
    return super.skipToQueueItem(index);
  }

  Future<void> playAudioSource({
    required AudioSource audioSource,
    required String mediaId,
  }) async {
    if (mediaItem.value?.id == mediaId) {
      await audioPlayer.setAudioSource(audioSource);
      isLinkProcessing.add(false);
      await play();
      if (Platform.isWindows && audioPlayer.playing == false) {
        // temp fix for windows (first play not working)
        await play();
      }
    }
  }

  @override
  Future<void> playMediaItem(MediaItem mediaItem, {bool doPlay = true}) async {
    updateMediaItem(mediaItem);

    isLinkProcessing.add(true);
    audioPlayer.pause();
    audioPlayer.seek(Duration.zero);

    final audioSource = await getAudioSource(mediaItem);
    if (audioSource != null) {
      await playAudioSource(audioSource: audioSource, mediaId: mediaItem.id);
    }
    await check4RelatedSongs();
  }

  Future<void> prepare4play({int idx = 0, bool doPlay = false}) async {
    if (queue.value.isNotEmpty) {
      currentPlayingIdx = idx;
      await playMediaItem(currentMedia, doPlay: doPlay);
      AppDatabaseService.putRecentlyPlayed(mediaItem2MediaItemDB(currentMedia));
    }
  }

  Future<void> playOffsetIdx({int offset = 1}) async {
    if (offset >= 0) {
      if (shuffleMode.value) {
        if (offset + shuffleIdx < queue.value.length) {
          prepare4play(idx: shuffleList[offset + shuffleIdx], doPlay: true);
          shuffleIdx = shuffleIdx + offset;
        }
      } else {
        if (currentPlayingIdx + offset < queue.value.length) {
          prepare4play(idx: offset + currentPlayingIdx, doPlay: true);
        }
      }
    }
  }

  @override
  Future<void> rewind() async {
    if (audioPlayer.processingState == ProcessingState.ready) {
      await audioPlayer.seek(Duration.zero);
    } else if (audioPlayer.processingState == ProcessingState.completed) {
      await prepare4play(idx: currentPlayingIdx);
    }
  }

  @override
  Future<void> skipToNext() async {
    await loadRelatedSongs();
    if (!shuffleMode.value) {
      if (currentPlayingIdx < (queue.value.length - 1)) {
        currentPlayingIdx++;
        prepare4play(idx: currentPlayingIdx, doPlay: true);
      } else if (loopMode.value == LoopMode.all) {
        currentPlayingIdx = 0;
        prepare4play(idx: currentPlayingIdx, doPlay: true);
      }
    } else {
      if (shuffleIdx < (queue.value.length - 1)) {
        shuffleIdx++;
        if (shuffleIdx >= shuffleList.length) {
          shuffleIdx = 0;
        }
        prepare4play(idx: shuffleList[shuffleIdx], doPlay: true);
      } else if (loopMode.value == LoopMode.all) {
        shuffleIdx = 0;
        prepare4play(idx: shuffleList[shuffleIdx], doPlay: true);
      }
    }
  }

  @override
  Future<void> stop() async {
    audioPlayer.stop();
    super.stop();
  }

  @override
  Future<void> skipToPrevious() async {
    if (!shuffleMode.value) {
      if (currentPlayingIdx > 0) {
        currentPlayingIdx--;
        prepare4play(idx: currentPlayingIdx, doPlay: true);
      }
    } else {
      if (shuffleIdx > 0) {
        shuffleIdx--;
        prepare4play(idx: shuffleList[shuffleIdx], doPlay: true);
      }
    }
  }

  @override
  Future<void> onTaskRemoved() {
    super.stop();
    audioPlayer.dispose();
    return super.onTaskRemoved();
  }

  @override
  Future<void> onNotificationDeleted() {
    audioPlayer.dispose();
    audioPlayer.stop();
    super.stop();

    return super.onNotificationDeleted();
  }

  @override
  Future<void> insertQueueItem(int index, MediaItem mediaItem) async {
    if (index < queue.value.length) {
      queue.value.insert(index, mediaItem);
    } else {
      queue.add(queue.value..add(mediaItem));
    }
  }

  @override
  Future<void> addQueueItem(
    MediaItem mediaItem, {
    bool doPlay = true,
    bool atLast = false,
    bool single = false,
  }) async {
    if (single) {
      queue.add(
        [
          mediaItem,
        ],
      );
      queueTitle.add("Queue");
      relatedSongs.add([]);
      await prepare4play(idx: 0, doPlay: doPlay);
      return;
    }

    if (fromPlaylist.value) {
      fromPlaylist.add(false);
      if (!doPlay) {
        queue.add([currentMedia, mediaItem]);
        currentPlayingIdx = 0;
        if (audioPlayer.processingState == ProcessingState.completed) {
          queue.add([mediaItem]);
          await prepare4play(idx: 0, doPlay: doPlay);
        }
      } else {
        queue.add([mediaItem]);
        await prepare4play(idx: 0, doPlay: doPlay);
      }
    } else {
      if (atLast) {
        queue.add(queue.value..add(mediaItem));
      } else if (currentPlayingIdx >= queue.value.length - 1 || queue.value.isEmpty) {
        queue.add(queue.value..add(mediaItem));
        if (doPlay) {
          await prepare4play(idx: queue.value.length - 1, doPlay: doPlay);
        } else if (audioPlayer.processingState == ProcessingState.completed || queue.value.length == 1) {
          await prepare4play(idx: queue.value.length - 1, doPlay: doPlay);
        }
      } else {
        queue.add(queue.value..insert(currentPlayingIdx + 1, mediaItem));
        if (doPlay) {
          await prepare4play(idx: currentPlayingIdx + 1, doPlay: true);
        }
      }
      shuffle(shuffleMode.value);
    }
    queueTitle.add("Queue");
  }

  @override
  Future<void> addQueueItems(
    List<MediaItem> mediaItems, {
    String queueName = "Queue",
    bool atLast = false,
  }) async {
    if (!atLast) {
      for (MediaItem mediaItem in mediaItems) {
        await addQueueItem(
          mediaItem,
          atLast: true,
        );
      }
    } else {
      if (fromPlaylist.value) {
        fromPlaylist.add(false);
      }
      queue.add(queue.value..addAll(mediaItems));
      queueTitle.add("Queue");
    }
  }

  @override
  Future<void> removeQueueItemAt(int index) async {
    queue.value.removeAt(index);
  }
}
