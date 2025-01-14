import 'package:isar/isar.dart';

import '../../utils/fast_hash.dart';

part 'charts_cache_database.g.dart';

@embedded
class ChartItemDatabase {
  String? title;
  String? artist;
  String? artURL;
}

@collection
class ChartsCacheDatabase {
  Id get isarId => fastHash(chartName);
  final String chartName;
  final DateTime lastUpdated;
  final String? permaURL;
  final List<ChartItemDatabase> chartItems;

  ChartsCacheDatabase({
    required this.chartName,
    required this.lastUpdated,
    required this.chartItems,
    this.permaURL,
  });
}
