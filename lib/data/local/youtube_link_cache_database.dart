import 'package:isar/isar.dart';

import '../fast_hash.dart';

part 'youtube_link_cache_database.g.dart';

@collection
class YoutubeLinkCacheDatabase {
  Id get isarId => fastHash(videoId);
  final String videoId;
  final String? lowQURL;
  final String highQURL;
  final int expireAt;

  const YoutubeLinkCacheDatabase({
    required this.videoId,
    required this.lowQURL,
    required this.highQURL,
    required this.expireAt,
  });
}
