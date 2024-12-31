import 'package:isar/isar.dart';

import 'media_item_database.dart';

part 'recently_played_database.g.dart';

@collection
class RecentlyPlayedDB {
  Id? id;
  final DateTime lastPlayed;

  RecentlyPlayedDB({
    this.id,
    required this.lastPlayed,
  });

  IsarLink<MediaItemDatabase> mediaItem = IsarLink<MediaItemDatabase>();
}
