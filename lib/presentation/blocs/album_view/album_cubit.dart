import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/album_model.dart';
import '../../../models/media_item_model.dart';
import '../../../models/saavn_model.dart';
import '../../../models/source_engines.dart';
import '../../../models/yt_music_model.dart';
import '../../../repository/saavn/saavn_api.dart';
import '../../../repository/youtube/yt_music_api.dart';
import '../../../service/app_database_service.dart';
import '../../../service/snack_bar_service.dart';

part 'album_state.dart';

class AlbumCubit extends Cubit<AlbumState> {
  final AlbumModel album;
  final SourceEngine sourceEngine;

  AlbumCubit({required this.album, required this.sourceEngine}) : super(AlbumInitial()) {
    emit(AlbumLoading(album: album));
    checkIsSaved();
    switch (sourceEngine) {
      case SourceEngine.engJIS:
        SaavnAPI.fetchAlbumDetails(album.extra['token']).then(
          (value) {
            emit(
              AlbumLoaded(
                album: album.copyWith(
                  songs: List<MediaItemModel>.from(
                    fromSaavnSongMapList2MediaItemList(
                      value['songs'],
                    ),
                  ),
                ),
                isSavedToCollections: state.isSavedToCollections,
              ),
            );
          },
        );
        break;
      case SourceEngine.engYTM:
        YtMusicService().getAlbumDetails(album.sourceId.replaceAll("youtube", '')).then(
          (value) {
            final List<MediaItemModel> songs = fromYtSongMapList2MediaItemList(value['songs']);
            emit(
              AlbumLoaded(
                album: album.copyWith(
                  songs: List<MediaItemModel>.from(songs),
                  artists: value['artist'] ?? album.artists,
                  description: value['subtitle'] ?? album.description,
                ),
                isSavedToCollections: state.isSavedToCollections,
              ),
            );
          },
        );
      case SourceEngine.engYTV:
      // TODO: Handle this case.
    }
  }

  Future<void> checkIsSaved() async {
    bool isSaved = await AppDatabaseService.isInSavedCollections(album.sourceId);
    if (state.isSavedToCollections != isSaved) {
      emit(
        state.copyWith(isSavedToCollections: isSaved),
      );
    }
  }

  Future<void> addToSavedCollections() async {
    if (!state.isSavedToCollections) {
      await AppDatabaseService.putOnlAlbumModel(album);
      SnackBarService.showMessage("Album added to Library!");
    } else {
      await AppDatabaseService.removeFromSavedCollection(album.sourceId);
      SnackBarService.showMessage("Album removed from Library!");
    }
    checkIsSaved();
  }
}
