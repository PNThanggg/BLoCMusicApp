part of 'app_player_cubit.dart';

class AppPlayerState extends Equatable {
  final bool isReady;
  final bool showLyrics;

  const AppPlayerState({
    required this.isReady,
    this.showLyrics = false,
  });

  @override
  List<Object> get props => [
        isReady,
        showLyrics,
      ];
}

final class AppPlayerInitial extends AppPlayerState {
  const AppPlayerInitial()
      : super(
          isReady: false,
        );
}

class ProgressBarStreams {
  final Duration currentPos;
  final PlaybackEvent currentPlaybackState;
  final PlayerState currentPlayerState;

  const ProgressBarStreams({
    required this.currentPos,
    required this.currentPlaybackState,
    required this.currentPlayerState,
  });
}
