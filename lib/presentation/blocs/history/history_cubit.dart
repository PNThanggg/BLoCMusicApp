import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../../models/media_playlist_model.dart';
import '../../../service/app_database_service.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  StreamSubscription<void>? watcher;

  HistoryCubit() : super(HistoryInitial()) {
    getRecentlyPlayed();
    watchRecentlyPlayed();
  }

  Future<void> watchRecentlyPlayed() async {
    watcher = (await AppDatabaseService.watchRecentlyPlayed()).listen((event) {
      getRecentlyPlayed();
      log("History Updated");
    });
  }

  void getRecentlyPlayed() async {
    final mediaPlaylist = await AppDatabaseService.getRecentlyPlayed();
    emit(
      state.copyWith(
        mediaPlaylist: mediaPlaylist,
      ),
    );
  }

  @override
  Future<void> close() {
    watcher?.cancel();
    return super.close();
  }
}
