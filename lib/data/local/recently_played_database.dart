import 'package:isar/isar.dart';

import 'media_item_database.dart';

part 'recently_played_database.g.dart';

@collection
class RecentlyPlayedDatabase {
  Id? id;
  final DateTime lastPlayed;

  RecentlyPlayedDatabase({
    this.id,
    required this.lastPlayed,
  });

  IsarLink<MediaItemDatabase> mediaItem = IsarLink<MediaItemDatabase>();
}
