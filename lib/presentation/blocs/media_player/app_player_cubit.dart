import 'package:bloc/bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_debounce/easy_throttle.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import '../../../service/app_player.dart';
import '../../../service/audio_service_initializer.dart';

part 'app_player_state.dart';

enum PlayerInitState {
  initializing,
  initialized,
  initial,
}

class AppPlayerCubit extends Cubit<AppPlayerState> {
  late AppMusicPlayer appMusicPlayer;
  PlayerInitState playerInitState = PlayerInitState.initial;

  // late AudioSession audioSession;
  late Stream<ProgressBarStreams> progressStreams;

  AppPlayerCubit() : super(const AppPlayerInitial()) {
    setupPlayer().then(
      (value) => emit(
        const AppPlayerState(isReady: true),
      ),
    );
  }

  void switchShowLyrics({bool? value}) {
    emit(
      AppPlayerState(
        isReady: true,
        showLyrics: value ?? !state.showLyrics,
      ),
    );
  }

  Future<void> setupPlayer() async {
    playerInitState = PlayerInitState.initializing;
    appMusicPlayer = await AudioServiceInitializer().getAppMusicPlayer();
    playerInitState = PlayerInitState.initialized;
    progressStreams = Rx.defer(
      () => Rx.combineLatest3(
        appMusicPlayer.audioPlayer.positionStream,
        appMusicPlayer.audioPlayer.playbackEventStream,
        appMusicPlayer.audioPlayer.playerStateStream,
        (
          Duration a,
          PlaybackEvent b,
          PlayerState c,
        ) =>
            ProgressBarStreams(
          currentPos: a,
          currentPlaybackState: b,
          currentPlayerState: c,
        ),
      ),
      reusable: true,
    );
    appMusicPlayer.audioPlayer.playerStateStream.listen((event) {
      if (event.processingState == ProcessingState.completed && appMusicPlayer.loopMode.value != LoopMode.one) {
        EasyThrottle.throttle(
          'skipNext',
          const Duration(milliseconds: 7000),
          () async => await appMusicPlayer.skipToNext(),
        );
      }
    });
  }

  @override
  Future<void> close() {
    EasyDebounce.cancelAll();
    appMusicPlayer.stop();
    appMusicPlayer.audioPlayer.dispose();

    return super.close();
  }
}
