import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/data/local/media_playlist_database.dart';

import '../../../models/album_model.dart';
import '../../../models/artist_model.dart';
import '../../../models/media_item_model.dart';
import '../../../models/media_playlist_model.dart';
import '../../../models/playlist_onl_model.dart';
import '../../../service/app_database_service.dart';
import '../../../service/snack_bar_service.dart';
import '../app_database/app_database_cubit.dart';

part 'library_items_state.dart';

class LibraryItemsCubit extends Cubit<LibraryItemsState> {
  Stream<void>? playlistWatcherDB;
  Stream<void>? savedCollecsWatcherDB;
  List<PlaylistItemProperties> playlistItems = List.empty();
  AppDatabaseCubit appDatabaseCubit;
  List<MediaPlaylist> mediaPlaylists = [];
  StreamSubscription? strmSubsDB;
  StreamSubscription? strmSubsDB2;

  LibraryItemsCubit({
    required this.appDatabaseCubit,
  }) : super(LibraryItemsInitial()) {
    getAndEmitPlaylists();
    getAndEmitSavedOnlCollections();
    getDBWatcher();
  }

  @override
  Future<void> close() {
    strmSubsDB?.cancel();
    return super.close();
  }

  Future<void> getDBWatcher() async {
    playlistWatcherDB = await AppDatabaseService.getPlaylistsWatcher();
    strmSubsDB = playlistWatcherDB?.listen((event) {
      getAndEmitPlaylists();
    });
    savedCollecsWatcherDB = await AppDatabaseService.getSavedCollecsWatcher();
    strmSubsDB2 = savedCollecsWatcherDB?.listen((event) {
      getAndEmitSavedOnlCollections();
    });
  }

  Future<void> getAndEmitPlaylists() async {
    mediaPlaylists = await AppDatabaseService.getPlaylists4Library();
    if (mediaPlaylists.isNotEmpty) {
      playlistItems = mediaPlaylistsDB2ItemProperties(mediaPlaylists);

      emit(LibraryItemsState(
        playlists: playlistItems,
        albums: state.albums,
        artists: state.artists,
        playlistsOnl: state.playlistsOnl,
      ));
    } else {
      emit(LibraryItemsInitial());
    }
  }

  Future<void> getAndEmitSavedOnlCollections() async {
    final collecs = await AppDatabaseService.getSavedCollections();
    List<ArtistModel> artists = [];
    List<AlbumModel> albums = [];
    List<PlaylistOnlModel> playlists = [];
    for (var element in collecs) {
      switch (element.runtimeType) {
        case ArtistModel:
          artists.add(element as ArtistModel);
          break;
        case AlbumModel:
          albums.add(element as AlbumModel);
          break;
        case PlaylistOnlModel:
          playlists.add(element as PlaylistOnlModel);
          log("${element.runtimeType}");
          break;
        default:
          break;
      }
      emit(LibraryItemsState(
        artists: List<ArtistModel>.from(artists),
        albums: List<AlbumModel>.from(albums),
        playlistsOnl: List<PlaylistOnlModel>.from(playlists),
        playlists: state.playlists,
      ));
    }
  }

  List<PlaylistItemProperties> mediaPlaylistsDB2ItemProperties(List<MediaPlaylist> mediaPlaylists) {
    List<PlaylistItemProperties> playlists = List.empty(growable: true);
    if (mediaPlaylists.isNotEmpty) {
      for (var element in mediaPlaylists) {
        // log(element.playlistName, name: "LibCubit");
        playlists.add(
          PlaylistItemProperties(
            playlistName: element.playlistName,
            subTitle: "${element.mediaItems.length} Items",
            coverImgUrl:
                element.imgUrl ?? (element.mediaItems.isNotEmpty ? element.mediaItems.first.artUri?.toString() : null),
          ),
        );
      }
    }
    return playlists;
  }

  void removePlaylist(MediaPlaylistDatabase mediaPlaylistDB) {
    if (mediaPlaylistDB.playlistName != "Null") {
      AppDatabaseService.removePlaylist(mediaPlaylistDB);
      // getAndEmitPlaylists();
      SnackBarService.showMessage("Playlist ${mediaPlaylistDB.playlistName} removed");
    }
  }

  Future<void> addToPlaylist(MediaItemModel mediaItem, MediaPlaylistDatabase mediaPlaylistDB) async {
    if (mediaPlaylistDB.playlistName != "Null") {
      await appDatabaseCubit.addMediaItemToPlaylist(mediaItem, mediaPlaylistDB);
      getAndEmitPlaylists();
    }
  }

  void removeFromPlaylist(MediaItemModel mediaItem, MediaPlaylistDatabase mediaPlaylistDB) {
    if (mediaPlaylistDB.playlistName != "Null") {
      appDatabaseCubit.removeMediaFromPlaylist(mediaItem, mediaPlaylistDB);
      getAndEmitPlaylists();
      SnackBarService.showMessage("Removed ${mediaItem.title} from ${mediaPlaylistDB.playlistName}");
    }
  }

  Future<List<MediaItemModel>?> getPlaylist(String playlistName) async {
    try {
      final playlist = await AppDatabaseService.getPlaylistItemsByName(playlistName);

      if (playlist != null) {
        final mediaItems = playlist
            .map(
              (e) => mediaItemDB2MediaItem(e),
            )
            .toList();
        return mediaItems;
      }
    } catch (e) {
      log("Error in getting playlist: $e", name: "libItemCubit");
      return null;
    }
    return null;
  }
}
