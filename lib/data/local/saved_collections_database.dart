import 'package:isar/isar.dart';

import '../fast_hash.dart';

@collection
class SavedCollectionsDB {
  Id get isarId => fastHash(title);
  final String title;
  final String sourceId;
  final String source;
  final String type;
  final String coverArt;
  final String sourceURL;
  final String? subtitle;
  final DateTime lastUpdated;
  final String? extra;

 const SavedCollectionsDB({
    required this.title,
    required this.type,
    required this.coverArt,
    required this.sourceURL,
    required this.sourceId,
    required this.source,
    required this.lastUpdated,
    this.subtitle,
    this.extra,
  });
}
