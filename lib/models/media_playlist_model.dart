import 'package:equatable/equatable.dart';
import 'package:music/data/local/media_playlist_database.dart';
import 'package:music/data/local/playlists_info_database.dart';

import 'media_item_model.dart';

class MediaPlaylist extends Equatable {
  final List<MediaItemModel> mediaItems;
  final String playlistName;
  final String? imgUrl;
  final String? permaURL;
  final String? description;
  final String? artists;
  final bool isAlbum;
  final String? source;
  final DateTime? lastUpdated;

  const MediaPlaylist({
    required this.mediaItems,
    required this.playlistName,
    this.imgUrl,
    this.permaURL,
    this.description,
    this.artists,
    this.source,
    this.lastUpdated,
    this.isAlbum = false,
  });

  @override
  List<Object> get props => [
        mediaItems,
        playlistName,
      ];

  MediaPlaylist copyWith({
    List<MediaItemModel>? mediaItems,
    String? playlistName,
    String? imgUrl,
    String? permaURL,
    String? description,
    String? artists,
    bool? isAlbum,
    String? source,
    DateTime? lastUpdated,
  }) {
    return MediaPlaylist(
      mediaItems: mediaItems ?? this.mediaItems,
      playlistName: playlistName ?? this.playlistName,
      imgUrl: imgUrl ?? this.imgUrl,
      permaURL: permaURL ?? this.permaURL,
      description: description ?? this.description,
      artists: artists ?? this.artists,
      isAlbum: isAlbum ?? this.isAlbum,
      source: source ?? this.source,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}

MediaPlaylist fromPlaylistDB2MediaPlaylist(
  MediaPlaylistDatabase mediaPlaylistDB, {
  PlaylistsInfoDatabase? playlistsInfoDB,
}) {
  MediaPlaylist mediaPlaylist = MediaPlaylist(
    mediaItems: const [],
    playlistName: mediaPlaylistDB.playlistName,
  );

  if (mediaPlaylistDB.mediaItems.isNotEmpty) {
    for (var element in mediaPlaylistDB.mediaItems) {
      mediaPlaylist.mediaItems.add(
        mediaItemDB2MediaItem(element),
      );
    }
  }

  if (playlistsInfoDB != null) {
    mediaPlaylist = mediaPlaylist.copyWith(
      imgUrl: playlistsInfoDB.artURL,
      permaURL: playlistsInfoDB.permaURL,
      description: playlistsInfoDB.description,
      artists: playlistsInfoDB.artists,
      source: playlistsInfoDB.source,
      lastUpdated: playlistsInfoDB.lastUpdated,
      isAlbum: playlistsInfoDB.isAlbum,
    );
  }
  return mediaPlaylist;
}
