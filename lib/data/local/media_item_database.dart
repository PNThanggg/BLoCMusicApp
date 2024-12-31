import 'dart:convert';

import 'package:isar/isar.dart';

import 'media_playlist_database.dart';

part 'media_item_database.g.dart';

@collection
class MediaItemDatabase {
  Id? id = Isar.autoIncrement;
  @Index()
  final String title;
  final String album;
  final String artist;
  final String artURL;
  final String genre;
  final int? duration;
  final String mediaID;
  final String streamingURL;
  final String? source;
  final String permaURL;
  final String language;
  bool isLiked = false;

  // @Backlink(to: "mediaItems")
  IsarLinks<MediaPlaylistDatabase> mediaInPlaylistsDB = IsarLinks<MediaPlaylistDatabase>();

  MediaItemDatabase({
    this.id,
    required this.title,
    required this.album,
    required this.artist,
    required this.artURL,
    required this.genre,
    required this.mediaID,
    required this.streamingURL,
    this.source,
    this.duration,
    required this.permaURL,
    required this.language,
    required this.isLiked,
  });

  @override
  bool operator ==(covariant MediaItemDatabase other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.album == album &&
        other.artist == artist &&
        other.artURL == artURL &&
        other.genre == genre &&
        other.mediaID == mediaID &&
        other.streamingURL == streamingURL &&
        other.source == source &&
        other.duration == duration &&
        other.permaURL == permaURL &&
        other.language == language;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        album.hashCode ^
        artist.hashCode ^
        artURL.hashCode ^
        genre.hashCode ^
        mediaID.hashCode ^
        streamingURL.hashCode ^
        source.hashCode ^
        duration.hashCode ^
        permaURL.hashCode ^
        language.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': null,
      'title': title,
      'album': album,
      'artist': artist,
      'artURL': artURL,
      'genre': genre,
      'duration': duration,
      'mediaID': mediaID,
      'streamingURL': streamingURL,
      'source': source,
      'permaURL': permaURL,
      'language': language,
      'isLiked': isLiked,
    };
  }

  factory MediaItemDatabase.fromMap(Map<String, dynamic> map) {
    return MediaItemDatabase(
      id: null,
      title: map['title'] as String,
      album: map['album'] as String,
      artist: map['artist'] as String,
      artURL: map['artURL'] as String,
      genre: map['genre'] as String,
      duration: map['duration'] != null ? map['duration'] as int : null,
      mediaID: map['mediaID'] as String,
      streamingURL: map['streamingURL'] as String,
      source: map['source'] != null ? map['source'] as String : null,
      permaURL: map['permaURL'] as String,
      language: map['language'] as String,
      isLiked: map['isLiked'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory MediaItemDatabase.fromJson(String source) =>
      MediaItemDatabase.fromMap(json.decode(source) as Map<String, dynamic>);
}
