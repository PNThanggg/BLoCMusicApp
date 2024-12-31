import 'package:isar/isar.dart';

import '../fast_hash.dart';

part 'charts_cache_database.g.dart';

@embedded
class ChartItemDB {
  String? title;
  String? artist;
  String? artURL;
}

@collection
class ChartsCacheDB {
  Id get isarId => fastHash(chartName);
  String chartName;
  DateTime lastUpdated;
  String? permaURL;
  List<ChartItemDB> chartItems;

  ChartsCacheDB({
    required this.chartName,
    required this.lastUpdated,
    required this.chartItems,
    this.permaURL,
  });
}
