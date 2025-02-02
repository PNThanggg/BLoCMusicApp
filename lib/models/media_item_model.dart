import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:music/data/local/media_item_database.dart';

class MediaItemModel extends MediaItem {
  @override
  final String id;
  @override
  final String title;
  @override
  final String? album;
  @override
  final Uri? artUri;
  @override
  final String? artist;
  @override
  final Map<String, dynamic>? extras;
  @override
  final String? genre;
  @override
  final Duration? duration;

  MediaItemModel({
    required this.id,
    required this.title,
    this.album,
    this.artUri,
    this.artist,
    this.extras,
    this.genre,
    this.duration,
  }) : super(
          id: id,
          title: title,
          album: album,
          artUri: artUri,
          artist: artist,
          extras: extras,
          genre: genre,
          duration: duration,
        );

  @override
  bool operator ==(covariant MediaItemModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.album == album &&
        other.artUri == artUri &&
        other.artist == artist &&
        mapEquals(other.extras, extras) &&
        other.genre == genre;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        album.hashCode ^
        artUri.hashCode ^
        artist.hashCode ^
        extras.hashCode ^
        genre.hashCode;
  }
}

MediaItemModel mediaItem2MediaItemModel(MediaItem mediaItem) {
  return MediaItemModel(
    id: mediaItem.id,
    title: mediaItem.title,
    album: mediaItem.album,
    artUri: mediaItem.artUri,
    artist: mediaItem.artist,
    extras: mediaItem.extras,
    genre: mediaItem.genre,
    duration: mediaItem.duration,
  );
}

MediaItemDatabase mediaItem2MediaItemDB(MediaItem mediaItem) {
  return MediaItemDatabase(
    title: mediaItem.title,
    album: mediaItem.album ?? "Unknown",
    artist: mediaItem.artist ?? "Unknown",
    artURL: mediaItem.artUri.toString(),
    genre: mediaItem.genre ?? "Unknown",
    mediaID: mediaItem.id,
    duration: mediaItem.duration?.inSeconds,
    streamingURL: mediaItem.extras?["url"],
    permaURL: mediaItem.extras?["perma_url"],
    language: mediaItem.extras?["language"] ?? "Unknown",
    isLiked: false,
    source: mediaItem.extras?["source"] ?? "Saavn",
  );
}

MediaItemModel mediaItemDB2MediaItem(MediaItemDatabase mediaItemDB) {
  return MediaItemModel(
    id: mediaItemDB.mediaID,
    title: mediaItemDB.title,
    album: mediaItemDB.album,
    artist: mediaItemDB.artist,
    duration: mediaItemDB.duration != null ? Duration(seconds: mediaItemDB.duration!) : const Duration(seconds: 120),
    artUri: Uri.parse(mediaItemDB.artURL),
    genre: mediaItemDB.genre,
    extras: {
      "url": mediaItemDB.streamingURL,
      "source": mediaItemDB.source ?? "None",
      "perma_url": mediaItemDB.permaURL,
      "language": mediaItemDB.language,
    },
  );
}
