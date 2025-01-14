import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:isolate';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:music/data/local/charts_cache_database.dart';
import 'package:path_provider/path_provider.dart';

import '../../../models/chart_model.dart';
import '../../../models/media_playlist_model.dart';
import '../../../plugins/chart_defines.dart';
import '../../../repository/youtube/yt_charts_home.dart';
import '../../../repository/youtube/yt_music_api.dart';
import '../../../service/app_database_service.dart';

part 'explore_states.dart';

class TrendingCubit extends Cubit<TrendingCubitState> {
  bool isLatest = false;

  TrendingCubit() : super(TrendingCubitInitial()) {
    getTrendingVideosFromDB();
    getTrendingVideos();
  }

  void getTrendingVideos() async {
    List<ChartModel> ytCharts = await fetchTrendingVideos();
    ChartModel chart = ytCharts[0]
      ..copyWith(
        chartItems: getFirstElements(
          ytCharts[0].chartItems,
          16,
        ),
      );

    emit(
      state.copyWith(
        ytCharts: [chart],
      ),
    );
    isLatest = true;
  }

  List<ChartItemModel> getFirstElements(List<ChartItemModel> list, int count) {
    return list.length > count ? list.sublist(0, count) : list;
  }

  void getTrendingVideosFromDB() async {
    ChartModel? ytChart = await AppDatabaseService.getChart("Trending Videos");
    if ((!isLatest) && ytChart != null && (ytChart.chartItems.isNotEmpty)) {
      ChartModel chart = ytChart
        ..copyWith(
          chartItems: getFirstElements(
            ytChart.chartItems,
            16,
          ),
        );

      emit(
        state.copyWith(
          ytCharts: [chart],
        ),
      );
    }
  }
}

class RecentlyCubit extends Cubit<RecentlyCubitState> {
  StreamSubscription<void>? watcher;

  RecentlyCubit() : super(RecentlyCubitInitial()) {
    getRecentlyPlayed();
    watchRecentlyPlayed();
  }

  Future<void> watchRecentlyPlayed() async {
    watcher = (await AppDatabaseService.watchRecentlyPlayed()).listen((event) {
      getRecentlyPlayed();
      log("Recently Played Updated");
    });
  }

  @override
  Future<void> close() {
    watcher?.cancel();
    return super.close();
  }

  void getRecentlyPlayed() async {
    final mediaPlaylist = await AppDatabaseService.getRecentlyPlayed(limit: 15);
    emit(state.copyWith(mediaPlaylist: mediaPlaylist));
  }
}

class ChartCubit extends Cubit<ChartState> {
  ChartInfo chartInfo;
  StreamSubscription? strm;
  FetchChartCubit fetchChartCubit;

  ChartCubit(
    this.chartInfo,
    this.fetchChartCubit,
  ) : super(ChartInitial()) {
    getChartFromDB();
    initListener();
  }

  void initListener() {
    strm = fetchChartCubit.stream.listen((state) {
      if (state.isFetched) {
        log("Chart Fetched from Isolate - ${chartInfo.title}", name: "Isolate Fetched");
        getChartFromDB();
      }
    });
  }

  Future<void> getChartFromDB() async {
    final chart = await AppDatabaseService.getChart(chartInfo.title);
    if (chart != null) {
      emit(
        state.copyWith(
          chart: chart,
          coverImg: chart.chartItems.first.imageUrl,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    fetchChartCubit.close();
    strm?.cancel();
    return super.close();
  }
}

Map<String, List<dynamic>> parseYTMusicData(String source) {
  final dynamicMap = jsonDecode(source);

  Map<String, List<dynamic>> listDynamicMap;
  if (dynamicMap is Map) {
    listDynamicMap = dynamicMap.map((key, value) {
      List<dynamic> list = [];
      if (value is List) {
        list = value;
      }
      return MapEntry(key, list);
    });
  } else {
    listDynamicMap = {};
  }
  return listDynamicMap;
}

class FetchChartCubit extends Cubit<FetchChartState> {
  FetchChartCubit() : super(FetchChartInitial()) {
    fetchCharts();
  }

  Future<void> fetchCharts() async {
    String path = (await getApplicationSupportDirectory()).path;
    BackgroundIsolateBinaryMessenger.ensureInitialized(
      ServicesBinding.rootIsolateToken!,
    );
    await AppDatabaseService.database;
    final chartList = await Isolate.run<List<ChartModel>>(() async {
      List<ChartModel> chartList0 = List.empty(growable: true);
      ChartModel chart;
      final Isar db = await Isar.open(
        [
          ChartsCacheDatabaseSchema,
        ],
        directory: path,
      );

      for (var i in ChartInfo.chartInfoList) {
        final chartCacheDB = db.chartsCacheDatabases.where().filter().chartNameEqualTo(i.title).findFirstSync();
        bool shouldFetch = (chartCacheDB?.lastUpdated.difference(DateTime.now()).inHours.abs() ?? 80) > 16;

        if (shouldFetch) {
          chart = await i.chartFunction(i.url);
          if (chart.chartItems.isNotEmpty) {
            db.writeTxnSync(
              () => db.chartsCacheDatabases.putSync(
                chartModelToChartCacheDB(chart),
              ),
            );
          }
          log("Chart Fetched - ${chart.chartName}", name: "Isolate");
          chartList0.add(chart);
        }
      }
      db.close();
      return chartList0;
    });

    if (chartList.isNotEmpty) {
      emit(
        state.copyWith(
          isFetched: true,
        ),
      );
    }
  }
}

class YTMusicCubit extends Cubit<YTMusicCubitState> {
  YTMusicCubit() : super(YTMusicCubitInitial()) {
    fetchYTMusicDB();
    fetchYTMusic();
  }

  void fetchYTMusicDB() async {
    final data = await AppDatabaseService.getAPICache("YTMusic");
    if (data != null) {
      final ytmData = await compute(parseYTMusicData, data);
      if (ytmData.isNotEmpty) {
        emit(state.copyWith(ytmData: ytmData));
      }
    }
  }

  Future<void> fetchYTMusic() async {
    final ytCharts = await Isolate.run(
      () => YtMusicService().getMusicHome(countryCode: 'EN'),
    );

    if (ytCharts.isNotEmpty) {
      emit(
        state.copyWith(
          ytmData: Map<String, List<dynamic>>.from(ytCharts),
        ),
      );
      final ytChartsJson = await compute(jsonEncode, ytCharts);
      AppDatabaseService.putAPICache("YTMusic", ytChartsJson);
      log("YTMusic Fetched", name: "YTMusic");
    }
  }
}
