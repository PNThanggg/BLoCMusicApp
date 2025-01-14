import 'package:equatable/equatable.dart';

import '../data/local/charts_cache_database.dart';

class ChartModel extends Equatable {
  final String chartName;
  final String? url;
  final List<ChartItemModel> chartItems;
  final DateTime? lastUpdated;

  const ChartModel({
    required this.chartName,
    this.chartItems = const [],
    this.lastUpdated,
    this.url,
  });

  ChartModel copyWith({
    String? chartName,
    String? url,
    List<ChartItemModel>? chartItems,
    DateTime? lastUpdated,
  }) {
    return ChartModel(
      chartName: chartName ?? this.chartName,
      url: url ?? this.url,
      chartItems: chartItems ?? this.chartItems,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  List<Object?> get props => [
        chartName,
        url,
        lastUpdated,
        chartItems,
      ];
}

class ChartItemModel {
  final String? name;
  final String? imageUrl;
  final String? subtitle;

  ChartItemModel({
    required this.name,
    required this.imageUrl,
    required this.subtitle,
  });
}

ChartsCacheDatabase chartModelToChartCacheDB(ChartModel chartModel) {
  return ChartsCacheDatabase(
    chartItems: chartModel.chartItems
        .map(
          (e) => chartItemModelToChartItemDB(e),
        )
        .toList(),
    chartName: chartModel.chartName,
    lastUpdated: chartModel.lastUpdated ?? DateTime.now(),
    permaURL: chartModel.url,
  );
}

ChartModel chartCacheDBToChartModel(ChartsCacheDatabase chartsCacheDB) {
  return ChartModel(
    chartItems: chartsCacheDB.chartItems.map((e) => chartItemDBToChartItemModel(e)).toList(),
    chartName: chartsCacheDB.chartName,
    lastUpdated: chartsCacheDB.lastUpdated,
    url: chartsCacheDB.permaURL,
  );
}

ChartItemDatabase chartItemModelToChartItemDB(ChartItemModel chartItemModel) {
  return ChartItemDatabase()
    ..artURL = chartItemModel.imageUrl
    ..artist = chartItemModel.subtitle
    ..title = chartItemModel.name;
}

ChartItemModel chartItemDBToChartItemModel(ChartItemDatabase chartItemDB) {
  return ChartItemModel(
    imageUrl: chartItemDB.artURL,
    name: chartItemDB.title,
    subtitle: chartItemDB.artist,
  );
}
