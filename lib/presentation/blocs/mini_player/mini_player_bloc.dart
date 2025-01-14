import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';

import '../../../models/media_item_model.dart';
import '../../../utils/global_const.dart';
import '../media_player/app_player_cubit.dart';

part 'mini_player_event.dart';
part 'mini_player_state.dart';

class MiniPlayerBloc extends Bloc<MiniPlayerEvent, MiniPlayerState> {
  StreamSubscription<PlayerState>? _playerStateSubscription;
  StreamSubscription<bool>? _linkState;
  AppPlayerCubit playerCubit;

  MiniPlayerBloc({
    required this.playerCubit,
  }) : super(MiniPlayerInitial()) {
    listenToPlayer();
    on<MiniPlayerPlayedEvent>(played);
    on<MiniPlayerPausedEvent>(paused);
    on<MiniPlayerBufferingEvent>(buffering);
    on<MiniPlayerErrorEvent>(error);
    on<MiniPlayerProcessingEvent>(processing);
    on<MiniPlayerCompletedEvent>(completed);
    on<MiniPlayerInitialEvent>(initial);
  }

  void played(MiniPlayerPlayedEvent event, Emitter<MiniPlayerState> emit) {
    emit(MiniPlayerWorking(event.song, true, false));
  }

  void paused(MiniPlayerPausedEvent event, Emitter<MiniPlayerState> emit) {
    emit(MiniPlayerWorking(event.song, false, false));
  }

  void buffering(MiniPlayerBufferingEvent event, Emitter<MiniPlayerState> emit) {
    emit(MiniPlayerWorking(event.song, false, true));
  }

  void error(MiniPlayerErrorEvent event, Emitter<MiniPlayerState> emit) {
    emit(MiniPlayerError(event.song));
  }

  void processing(MiniPlayerProcessingEvent event, Emitter<MiniPlayerState> emit) {
    emit(MiniPlayerProcessing(event.song));
  }

  void completed(MiniPlayerCompletedEvent event, Emitter<MiniPlayerState> emit) {
    emit(MiniPlayerCompleted(event.song));
  }

  void initial(MiniPlayerInitialEvent event, Emitter<MiniPlayerState> emit) {
    emit(MiniPlayerInitial());
  }

  void listenToPlayer() {
    _linkState = playerCubit.appMusicPlayer.isLinkProcessing.listen((value) {
      if (value) {
        try {
          add(MiniPlayerProcessingEvent(playerCubit.appMusicPlayer.currentMedia));
          log("Processing link.", name: "MiniPlayer");
        } catch (e) {
          log(e.toString(), name: "MiniPlayer");
        }
      }
    });

    _playerStateSubscription = playerCubit.appMusicPlayer.audioPlayer.playerStateStream.listen((event) {
      log("${event.processingState}", name: "MiniPlayer");
      switch (event.processingState) {
        case ProcessingState.idle:
          add(MiniPlayerInitialEvent());
          break;
        case ProcessingState.loading:
          try {
            add(MiniPlayerProcessingEvent(playerCubit.appMusicPlayer.currentMedia));
          } catch (e) {
            log("$e");
          }
          break;
        case ProcessingState.buffering:
          try {
            add(MiniPlayerBufferingEvent(playerCubit.appMusicPlayer.currentMedia));
          } catch (e) {
            log("$e");
          }
          break;
        case ProcessingState.ready:
          try {
            if (event.playing) {
              add(
                MiniPlayerPlayedEvent(
                  playerCubit.appMusicPlayer.currentMedia,
                ),
              );
            } else if (playerCubit.appMusicPlayer.isLinkProcessing.value == true) {
              add(
                MiniPlayerProcessingEvent(
                  playerCubit.appMusicPlayer.currentMedia,
                ),
              );
            } else {
              add(
                MiniPlayerPausedEvent(
                  playerCubit.appMusicPlayer.currentMedia,
                ),
              );
            }
          } catch (e) {
            log("$e");
          }
          break;
        case ProcessingState.completed:
          try {
            add(
              MiniPlayerCompletedEvent(
                playerCubit.appMusicPlayer.currentMedia,
              ),
            );
          } catch (e) {
            log("$e");
          }
          break;
      }
    });
  }

  @override
  Future<void> close() {
    _playerStateSubscription?.cancel();
    _linkState?.cancel();
    return super.close();
  }
}
