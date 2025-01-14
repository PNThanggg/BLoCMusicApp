part of 'current_playlist_cubit.dart';

class CurrentPlaylistState extends Equatable {
  final bool isFetched;
  final MediaPlaylist mediaPlaylist;

  const CurrentPlaylistState({
    required this.isFetched,
    required this.mediaPlaylist,
  });

  CurrentPlaylistState copyWith({
    bool? isFetched,
    List<MediaItemModel>? mediaItem,
    String? playlistName,
    MediaPlaylist? mediaPlaylist,
  }) {
    return CurrentPlaylistState(
      isFetched: isFetched ?? this.isFetched,
      mediaPlaylist: mediaPlaylist ?? this.mediaPlaylist,
    );
  }

  @override
  List<Object?> get props => [
        isFetched,
        mediaPlaylist,
        mediaPlaylist.playlistName,
        mediaPlaylist.permaURL,
      ];
}

final class CurrentPlaylistInitial extends CurrentPlaylistState {
  const CurrentPlaylistInitial()
      : super(
          isFetched: false,
          mediaPlaylist: const MediaPlaylist(
            mediaItems: [],
            playlistName: "",
          ),
        );
}

final class CurrentPlaylistLoading extends CurrentPlaylistState {
  const CurrentPlaylistLoading()
      : super(
          isFetched: false,
          mediaPlaylist: const MediaPlaylist(
            mediaItems: [],
            playlistName: "loading",
          ),
        );
}
