import 'package:bloc/bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_debounce/easy_throttle.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import '../../../service/app_player.dart';
import '../../../service/audio_service_initializer.dart';

part 'bloomee_player_state.dart';

enum PlayerInitState { initializing, initialized, intial }

class BloomeePlayerCubit extends Cubit<BloomeePlayerState> {
  late AppMusicPlayer bloomeePlayer;
  PlayerInitState playerInitState = PlayerInitState.intial;

  // late AudioSession audioSession;
  late Stream<ProgressBarStreams> progressStreams;

  BloomeePlayerCubit() : super(BloomeePlayerInitial()) {
    setupPlayer().then(
      (value) => emit(
        BloomeePlayerState(isReady: true),
      ),
    );
  }

  void switchShowLyrics({bool? value}) {
    emit(
      BloomeePlayerState(
        isReady: true,
        showLyrics: value ?? !state.showLyrics,
      ),
    );
  }

  Future<void> setupPlayer() async {
    playerInitState = PlayerInitState.initializing;
    bloomeePlayer = await AudioServiceInitializer().getAppMusicPlayer();
    playerInitState = PlayerInitState.initialized;
    progressStreams = Rx.defer(
      () => Rx.combineLatest3(
          bloomeePlayer.audioPlayer.positionStream,
          bloomeePlayer.audioPlayer.playbackEventStream,
          bloomeePlayer.audioPlayer.playerStateStream,
          (Duration a, PlaybackEvent b, PlayerState c) =>
              ProgressBarStreams(currentPos: a, currentPlaybackState: b, currentPlayerState: c)),
      reusable: true,
    );
    bloomeePlayer.audioPlayer.playerStateStream.listen((event) {
      if (event.processingState == ProcessingState.completed && bloomeePlayer.loopMode.value != LoopMode.one) {
        EasyThrottle.throttle(
          'skipNext',
          const Duration(milliseconds: 7000),
          () async => await bloomeePlayer.skipToNext(),
        );
      }
    });
  }

  @override
  Future<void> close() {
    EasyDebounce.cancelAll();
    bloomeePlayer.stop();
    bloomeePlayer.audioPlayer.dispose();
    return super.close();
  }
}
