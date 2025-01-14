import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/media_item_model.dart';
import '../../../models/playlist_onl_model.dart';
import '../../../models/saavn_model.dart';
import '../../../models/source_engines.dart';
import '../../../models/youtube_vid_model.dart';
import '../../../models/yt_music_model.dart';
import '../../../repository/saavn/saavn_api.dart';
import '../../../repository/youtube/youtube_api.dart';
import '../../../repository/youtube/yt_music_api.dart';
import '../../../service/app_database_service.dart';
import '../../../service/snack_bar_service.dart';

part 'online_playlist_state.dart';

class OnlPlaylistCubit extends Cubit<OnlPlaylistState> {
  PlaylistOnlModel playlist;
  SourceEngine sourceEngine;

  OnlPlaylistCubit({
    required this.playlist,
    required this.sourceEngine,
  }) : super(OnlPlaylistInitial()) {
    emit(OnlPlaylistLoading(playlist: playlist));
    checkIsSaved();
    switch (sourceEngine) {
      case SourceEngine.engJIS:
        SaavnAPI.fetchPlaylistDetails(
          Uri.parse(playlist.sourceURL).pathSegments.last,
        ).then((value) {
          final plst = PlaylistOnlModel(
            name: value['playlistDetails']['album'],
            imageURL: value['playlistDetails']['image'],
            source: 'saavn',
            sourceId: value['playlistDetails']['id'],
            sourceURL: value['playlistDetails']['perma_url'],
            description: value['playlistDetails']['subtitle'],
            artists: value['playlistDetails']['artist'] ?? 'Various Artists',
            language: value['playlistDetails']['language'],
          );
          final songs = fromSaavnSongMapList2MediaItemList(value['songs']);

          emit(
            OnlPlaylistLoaded(
              playlist: playlist.copyWith(
                name: plst.name,
                imageURL: plst.imageURL,
                source: plst.source,
                sourceId: plst.sourceId,
                sourceURL: plst.sourceURL,
                description: plst.description,
                artists: plst.artists,
                songs: List<MediaItemModel>.from(songs),
              ),
              isSavedCollection: state.isSavedCollection,
            ),
          );
        });
        break;
      case SourceEngine.engYTM:
        YtMusicService().getPlaylist(playlist.sourceId.replaceAll("youtubeVL", "")).then(
          (value) {
            final songs = fromYtSongMapList2MediaItemList(value['songs']);
            emit(OnlPlaylistLoaded(
              playlist: playlist.copyWith(
                songs: List<MediaItemModel>.from(songs),
              ),
              isSavedCollection: state.isSavedCollection,
            ));
          },
        );
        break;
      case SourceEngine.engYTV:
        YouTubeServices().fetchPlaylistItems(playlist.sourceId).then((value) {
          final songs = fromYtVidSongMapList2MediaItemList(value[0]['items']);
          emit(
            OnlPlaylistLoaded(
              playlist: playlist.copyWith(
                songs: List<MediaItemModel>.from(songs),
                artists: value[0]['metadata'].author,
              ),
              isSavedCollection: state.isSavedCollection,
            ),
          );
        });
        break;
    }
  }

  Future<void> checkIsSaved() async {
    bool isSaved = await AppDatabaseService.isInSavedCollections(playlist.sourceId);
    if (state.isSavedCollection != isSaved) {
      emit(
        state.copyWith(isSavedCollection: isSaved),
      );
    }
  }

  Future<void> addToSavedCollections() async {
    if (!state.isSavedCollection) {
      await AppDatabaseService.putOnlPlaylistModel(playlist);
      SnackBarService.showMessage("Artist added to Library!");
    } else {
      await AppDatabaseService.removeFromSavedCollection(playlist.sourceId);
      SnackBarService.showMessage("Artist removed from Library!");
    }
    checkIsSaved();
  }
}
