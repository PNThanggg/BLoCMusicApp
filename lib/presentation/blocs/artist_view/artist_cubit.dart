import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/album_model.dart';
import '../../../models/artist_model.dart';
import '../../../models/media_item_model.dart';
import '../../../models/saavn_model.dart';
import '../../../models/source_engines.dart';
import '../../../models/yt_music_model.dart';
import '../../../repository/Youtube/yt_music_api.dart';
import '../../../repository/saavn/saavn_api.dart';
import '../../../service/app_database_service.dart';
import '../../../service/snack_bar_service.dart';

part 'artist_state.dart';

class ArtistCubit extends Cubit<ArtistState> {
  final ArtistModel artist;
  final SourceEngine sourceEngine;

  ArtistCubit({
    required this.artist,
    required this.sourceEngine,
  }) : super(ArtistInitial()) {
    emit(ArtistLoading(artist: artist));
    checkIsSaved();
    switch (sourceEngine) {
      case SourceEngine.engJIS:
        SaavnAPI.fetchArtistDetails(Uri.parse(artist.sourceURL).pathSegments.last).then((value) {
          final songs = fromSaavnSongMapList2MediaItemList(value['songs']);
          final albums = saavnMap2Albums({'Albums': value['albums']});
          emit(ArtistLoaded(
            artist: artist.copyWith(
              songs: List<MediaItemModel>.from(songs),
              description: value['subtitle'] ?? artist.description,
              albums: List<AlbumModel>.from(albums),
            ),
            isSavedCollection: state.isSavedCollection,
          ));
        });
        break;
      case SourceEngine.engYTM:
        YtMusicService().getArtistDetails(artist.sourceId).then((value) {
          log(value['songBrowseId'].toString());
          List<AlbumModel> albums = [];
          if (value['albums'] != null) {
            albums = ytmMap2Albums({
              'albums': value['albums'],
            });
          }
          if (value['songBrowseId'] != null) {
            log('inside more');
            YtMusicService().getPlaylist(value['songBrowseId'].toString().replaceAll('VL', '')).then((v2) {
              final songsFull = fromYtSongMapList2MediaItemList(v2['songs']);
              emit(
                ArtistLoaded(
                  artist: artist.copyWith(
                    songs: List<MediaItemModel>.from(songsFull),
                    albums: List<AlbumModel>.from(albums),
                  ),
                  isSavedCollection: state.isSavedCollection,
                ),
              );
            });
          } else {
            final songs = fromYtSongMapList2MediaItemList(value['songs']);
            emit(
              ArtistLoaded(
                artist: artist.copyWith(
                  songs: List<MediaItemModel>.from(songs),
                  albums: List<AlbumModel>.from(albums),
                ),
                isSavedCollection: state.isSavedCollection,
              ),
            );
          }
        });
        break;
      case SourceEngine.engYTV:
      // TODO: Handle this case.
    }
  }

  Future<void> checkIsSaved() async {
    bool isSaved = await AppDatabaseService.isInSavedCollections(artist.sourceId);
    if (state.isSavedCollection != isSaved) {
      emit(
        state.copyWith(isSavedCollection: isSaved),
      );
    }
  }

  Future<void> addToSavedCollections() async {
    if (!state.isSavedCollection) {
      await AppDatabaseService.putOnlArtistModel(artist);
      SnackBarService.showMessage("Artist added to Library!");
    } else {
      await AppDatabaseService.removeFromSavedCollection(artist.sourceId);
      SnackBarService.showMessage("Artist removed from Library!");
    }
    checkIsSaved();
  }
}
