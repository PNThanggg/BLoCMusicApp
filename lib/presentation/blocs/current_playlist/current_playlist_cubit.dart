import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../data/local/media_playlist_database.dart';
import '../../../models/media_item_model.dart';
import '../../../models/media_playlist_model.dart';
import '../../../service/app_database_service.dart';
import '../../../utils/pallete_generator.dart';
import '../app_database/app_database_cubit.dart';

part 'current_playlist_state.dart';

class CurrentPlaylistCubit extends Cubit<CurrentPlaylistState> {
  MediaPlaylist? mediaPlaylist;
  PaletteGenerator? paletteGenerator;
  late AppDatabaseCubit appDatabaseCubit;

  CurrentPlaylistCubit({
    this.mediaPlaylist,
    required this.appDatabaseCubit,
  }) : super(const CurrentPlaylistInitial());

  Future<void> setupPlaylist(String playlistName) async {
    emit(const CurrentPlaylistLoading());
    mediaPlaylist = await appDatabaseCubit.getPlaylistItems(
      MediaPlaylistDatabase(playlistName: playlistName),
    );

    if (mediaPlaylist?.mediaItems.isNotEmpty ?? false) {
      paletteGenerator = await getPaletteFromImage(
        mediaPlaylist!.mediaItems[0].artUri.toString(),
      );
    }

    emit(
      state.copyWith(
        playlistName: mediaPlaylist?.playlistName,
        isFetched: true,
        mediaPlaylist: mediaPlaylist,
        mediaItem: List<MediaItemModel>.from(mediaPlaylist!.mediaItems),
      ),
    );
  }

  Future<List<int>> getItemOrder() async {
    return await AppDatabaseService.getPlaylistItemsRankByName(mediaPlaylist!.playlistName);
  }

  String getTitle() {
    return state.mediaPlaylist.playlistName;
  }

  Future<void> updatePlaylist(List<int> newOrder) async {
    final oldOrder = await getItemOrder();
    if (!listEquals(newOrder, oldOrder) &&
        mediaPlaylist != null &&
        newOrder.length >= mediaPlaylist!.mediaItems.length) {
      await AppDatabaseService.updatePltItemsRankByName(mediaPlaylist!.playlistName, newOrder);
      final playlist = await appDatabaseCubit.getPlaylistItems(
        MediaPlaylistDatabase(playlistName: mediaPlaylist!.playlistName),
      );
      setupPlaylist(playlist.playlistName);
    }
  }

  int getPlaylistLength() {
    if (mediaPlaylist != null) {
      return mediaPlaylist?.mediaItems.length ?? 0;
    } else {
      return 0;
    }
  }

  String? getPlaylistCoverArt() {
    if (mediaPlaylist?.mediaItems.isNotEmpty ?? false) {
      return mediaPlaylist?.mediaItems[0].artUri.toString();
    } else {
      return "";
    }
  }

  PaletteGenerator? getCurrentPlaylistPalette() => paletteGenerator;
}
