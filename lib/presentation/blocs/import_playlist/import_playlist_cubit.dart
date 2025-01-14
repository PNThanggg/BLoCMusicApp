import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music/data/local/media_playlist_database.dart';
import 'package:rxdart/rxdart.dart';

import '../../../models/media_item_model.dart';
import '../../../models/youtube_vid_model.dart';
import '../../../repository/Youtube/youtube_api.dart';
import '../app_database/app_database_cubit.dart';

part 'import_playlist_state.dart';

class ImportPlaylistCubit extends Cubit<ImportPlaylistState> {
  BehaviorSubject<ImportPlaylistState> importYtPlaylistBS = BehaviorSubject.seeded(
    const ImportPlaylistStateInitial(),
  );

  ImportPlaylistCubit()
      : super(
          const ImportPlaylistStateInitial(),
        );

  Future<void> fetchYtPlaylistByID(
    String ytPlaylistID,
    AppDatabaseCubit appDatabaseCubit,
  ) async {
    importYtPlaylistBS.add(const ImportPlaylistStateInitial());
    final result = await YouTubeServices().fetchPlaylistItems(ytPlaylistID);
    final playlist = (result[0]["items"] as List);
    if (playlist.isNotEmpty) {
      for (int i = 0; i < playlist.length; i++) {
        importYtPlaylistBS.add(
          ImportPlaylistState(
            playlistName: result[0]["metadata"].title,
            itemName: playlist[i]["title"],
            totalLength: playlist.length,
            currentItem: i,
          ),
        );

        MediaItemModel mediaItemModel = fromYtVidSongMap2MediaItem(playlist[i]);
        appDatabaseCubit.addMediaItemToPlaylist(
          mediaItemModel,
          MediaPlaylistDatabase(playlistName: result[0]["metadata"].title),
        );
      }
    }

    importYtPlaylistBS.add(
      const ImportPlaylistStateComplete(),
    );
    await Future.delayed(const Duration(milliseconds: 2000));
    importYtPlaylistBS.add(
      const ImportPlaylistStateInitial(),
    );
  }

  @override
  Future<void> close() async {
    importYtPlaylistBS.close();
    super.close();
  }
}
