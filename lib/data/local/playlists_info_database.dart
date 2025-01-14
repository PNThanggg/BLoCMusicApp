import 'dart:convert';

import 'package:isar/isar.dart';

import '../../utils/fast_hash.dart';

part 'playlists_info_database.g.dart';

@collection
class PlaylistsInfoDatabase {
  Id get isarId => fastHash(playlistName);
  final String playlistName;
  final bool? isAlbum;
  final String? artURL;
  final String? description;
  final String? permaURL;
  final String? source;
  final String? artists;
  final DateTime lastUpdated;

  PlaylistsInfoDatabase({
    required this.playlistName,
    required this.lastUpdated,
    this.isAlbum,
    this.artURL,
    this.description,
    this.permaURL,
    this.source,
    this.artists,
  });

  @override
  bool operator ==(covariant PlaylistsInfoDatabase other) {
    if (identical(this, other)) return true;

    return other.playlistName == playlistName;
  }

  @override
  int get hashCode {
    return playlistName.hashCode;
  }

  @override
  String toString() {
    return 'PlaylistsInfoDB(playlistName: $playlistName, isAlbum: $isAlbum, artURL: $artURL, description: $description, permaURL: $permaURL, source: $source, artists: $artists, lastUpdated: $lastUpdated)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'playlistName': playlistName,
      'isAlbum': isAlbum,
      'artURL': artURL,
      'description': description,
      'permaURL': permaURL,
      'source': source,
      'artists': artists,
      'lastUpdated': lastUpdated.millisecondsSinceEpoch,
    };
  }

  factory PlaylistsInfoDatabase.fromMap(Map<String, dynamic> map) {
    return PlaylistsInfoDatabase(
      playlistName: map['playlistName'] as String,
      isAlbum: map['isAlbum'] != null ? map['isAlbum'] as bool : null,
      artURL: map['artURL'] != null ? map['artURL'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      permaURL: map['permaURL'] != null ? map['permaURL'] as String : null,
      source: map['source'] != null ? map['source'] as String : null,
      artists: map['artists'] != null ? map['artists'] as String : null,
      lastUpdated: DateTime.fromMillisecondsSinceEpoch(map['lastUpdated'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaylistsInfoDatabase.fromJson(String source) =>
      PlaylistsInfoDatabase.fromMap(json.decode(source) as Map<String, dynamic>);
}
