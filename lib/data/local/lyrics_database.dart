import 'package:isar/isar.dart';

import '../../utils/fast_hash.dart';

part 'lyrics_database.g.dart';

@collection
class LyricsDatabase {
  Id get isarId => fastHash(mediaID);
  final String sourceId;
  final String mediaID;
  final String plainLyrics;
  final String title;
  final String artist;
  final String source;
  final String? album;
  final int? offset;
  final int? duration;
  final String? url;
  final String? syncedLyrics;

  LyricsDatabase({
    required this.sourceId,
    required this.mediaID,
    required this.plainLyrics,
    required this.title,
    required this.artist,
    required this.source,
    this.album,
    this.offset,
    this.duration,
    this.syncedLyrics,
    this.url,
  });
}
