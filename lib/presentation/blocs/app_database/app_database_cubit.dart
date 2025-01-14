import 'package:audio_service/audio_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:music/data/local/app_settings_str_database.dart';

import '../../../data/local/app_settings_bool_database.dart';
import '../../../data/local/media_item_database.dart';
import '../../../data/local/media_playlist_database.dart';
import '../../../models/media_item_model.dart';
import '../../../models/media_playlist_model.dart';
import '../../../service/app_database_service.dart';
import '../../../service/snack_bar_service.dart';
import '../../theme/app_color.dart';

part 'app_database_state.dart';

class AppDatabaseCubit extends Cubit<MediaDatabaseState> {
  AppDatabaseCubit() : super(MediaDatabaseInitial()) {
    addNewPlaylistToDB(MediaPlaylistDatabase(playlistName: "Liked"));
  }

  Future<void> addNewPlaylistToDB(MediaPlaylistDatabase mediaPlaylistDB, {bool undo = false}) async {
    List<String> list = await getListOfPlaylists();
    if (!list.contains(mediaPlaylistDB.playlistName)) {
      AppDatabaseService.addPlaylist(mediaPlaylistDB);
      // refreshLibrary.add(true);
      if (!undo) {
        SnackBarService.showMessage("Playlist ${mediaPlaylistDB.playlistName} added");
      }
    }
  }

  Future<void> setLike(MediaItem mediaItem, {isLiked = false}) async {
    AppDatabaseService.addMediaItem(mediaItem2MediaItemDB(mediaItem), "Liked");
    // refreshLibrary.add(true);
    AppDatabaseService.likeMediaItem(mediaItem2MediaItemDB(mediaItem), isLiked: isLiked);
    if (isLiked) {
      SnackBarService.showMessage("${mediaItem.title} is Liked!!");
    } else {
      SnackBarService.showMessage("${mediaItem.title} is Unliked!!");
    }
  }

  Future<bool> isLiked(MediaItem mediaItem) {
    // bool res = true;
    return AppDatabaseService.isMediaLiked(mediaItem2MediaItemDB(mediaItem));
  }

  List<MediaItemDatabase> reorderByRank(List<MediaItemDatabase> orgMediaList, List<int> rankIndex) {
    List<MediaItemDatabase> reorderedList = orgMediaList;

    if (rankIndex.length == orgMediaList.length) {
      reorderedList = rankIndex
          .map(
            (e) => orgMediaList.firstWhere(
              (element) => e == element.id,
            ),
          )
          .map((e) => e)
          .toList();
      return reorderedList;
    } else {
      return orgMediaList;
    }
  }

  Future<MediaPlaylist> getPlaylistItems(MediaPlaylistDatabase mediaPlaylistDB) async {
    MediaPlaylist mediaPlaylist = MediaPlaylist(mediaItems: [], playlistName: mediaPlaylistDB.playlistName);

    var dbList = await AppDatabaseService.getPlaylistItems(mediaPlaylistDB);
    final playlist = await AppDatabaseService.getPlaylist(mediaPlaylistDB.playlistName);
    final info = await AppDatabaseService.getPlaylistInfo(mediaPlaylistDB.playlistName);
    if (playlist != null) {
      mediaPlaylist = fromPlaylistDB2MediaPlaylist(mediaPlaylistDB, playlistsInfoDB: info);

      if (dbList != null) {
        List<int> rankList = await AppDatabaseService.getPlaylistItemsRank(mediaPlaylistDB);

        if (rankList.isNotEmpty) {
          dbList = reorderByRank(dbList, rankList);
        }
        mediaPlaylist.mediaItems.clear();

        for (var element in dbList) {
          mediaPlaylist.mediaItems.add(mediaItemDB2MediaItem(element));
        }
      }
    }
    return mediaPlaylist;
  }

  Future<void> setPlayListItemsRank(MediaPlaylistDatabase mediaPlaylistDB, List<int> rankList) async {
    AppDatabaseService.setPlaylistItemsRank(mediaPlaylistDB, rankList);
  }

  Future<Stream> getStreamOfPlaylist(MediaPlaylistDatabase mediaPlaylistDB) async {
    return await AppDatabaseService.getStream4MediaList(mediaPlaylistDB);
  }

  Future<List<String>> getListOfPlaylists() async {
    List<String> mediaPlaylists = [];
    final albumList = await AppDatabaseService.getPlaylists4Library();
    if (albumList.isNotEmpty) {
      albumList.toList().forEach((element) {
        mediaPlaylists.add(element.playlistName);
      });
    }
    return mediaPlaylists;
  }

  Future<List<MediaPlaylist>> getListOfPlaylists2() async {
    List<MediaPlaylist> mediaPlaylists = [];
    final albumList = await AppDatabaseService.getPlaylists4Library();
    if (albumList.isNotEmpty) {
      albumList.toList().forEach((element) {
        mediaPlaylists.add(element);
      });
    }
    return mediaPlaylists;
  }

  Future<void> reorderPositionOfItemInDB(String playlistName, int oldIndex, int newIndex) async {
    AppDatabaseService.reorderItemPositionInPlaylist(
      MediaPlaylistDatabase(playlistName: playlistName),
      oldIndex,
      newIndex,
    );
  }

  Future<void> removePlaylist(MediaPlaylistDatabase mediaPlaylistDB) async {
    AppDatabaseService.removePlaylist(mediaPlaylistDB);
    SnackBarService.showMessage(
      "${mediaPlaylistDB.playlistName} is Deleted!!",
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: "Undo",
        textColor: AppColor.accentColor2,
        onPressed: () => addNewPlaylistToDB(
          mediaPlaylistDB,
          undo: true,
        ),
      ),
    );
  }

  Future<void> removeMediaFromPlaylist(MediaItem mediaItem, MediaPlaylistDatabase mediaPlaylistDB) async {
    MediaItemDatabase mediaItemDB = mediaItem2MediaItemDB(mediaItem);
    AppDatabaseService.removeMediaItemFromPlaylist(mediaItemDB, mediaPlaylistDB).then((value) {
      SnackBarService.showMessage(
        "${mediaItem.title} is removed from ${mediaPlaylistDB.playlistName}!!",
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: "Undo",
          textColor: AppColor.accentColor2,
          onPressed: () => addMediaItemToPlaylist(
            mediaItemDB2MediaItem(mediaItemDB),
            mediaPlaylistDB,
            undo: true,
          ),
        ),
      );
    });
  }

  Future<int?> addMediaItemToPlaylist(
    MediaItemModel mediaItemModel,
    MediaPlaylistDatabase mediaPlaylistDB, {
    bool undo = false,
  }) async {
    final id = await AppDatabaseService.addMediaItem(
      mediaItem2MediaItemDB(mediaItemModel),
      mediaPlaylistDB.playlistName,
    );
    // refreshLibrary.add(true);
    if (!undo) {
      SnackBarService.showMessage("${mediaItemModel.title} is added to ${mediaPlaylistDB.playlistName}!!");
    }
    return id;
  }

  Future<bool?> getSettingBool(String key) async {
    return await AppDatabaseService.getSettingBool(key);
  }

  Future<void> putSettingBool(String key, bool value) async {
    if (key.isNotEmpty) {
      AppDatabaseService.putSettingBool(key, value);
    }
  }

  Future<String?> getSettingStr(String key) async {
    return await AppDatabaseService.getSettingStr(key);
  }

  Future<void> putSettingStr(String key, String value) async {
    if (key.isNotEmpty && value.isNotEmpty) {
      AppDatabaseService.putSettingStr(key, value);
    }
  }

  Future<Stream<AppSettingsStrDatabase?>?> getWatcher4SettingStr(String key) async {
    if (key.isNotEmpty) {
      return await AppDatabaseService.getWatcher4SettingStr(key);
    } else {
      return null;
    }
  }

  Future<Stream<AppSettingsBoolDatabase?>?> getWatcher4SettingBool(String key) async {
    if (key.isNotEmpty) {
      var watcher = await AppDatabaseService.getWatcher4SettingBool(key);
      if (watcher != null) {
        return watcher;
      } else {
        AppDatabaseService.putSettingBool(key, false);
        return AppDatabaseService.getWatcher4SettingBool(key);
      }
    } else {
      return null;
    }
  }
}
