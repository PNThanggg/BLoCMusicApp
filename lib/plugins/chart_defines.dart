import 'dart:math';

import '../models/chart_model.dart';
import 'billboard_charts.dart';
import 'last_dot_fm_charts.dart';
import 'melon_charts.dart';
import 'spotify_top50_chart.dart';

typedef ChartFunction = Future<ChartModel> Function(ChartURL url);

class ChartURL {
  final String url;
  final String title;
  ChartURL({required this.url, required this.title});
}

class ChartInfo {
  final ChartFunction chartFunction;
  final String title;
  String imgUrl;
  final ChartURL url;
  bool show;

  ChartInfo({
    required this.chartFunction,
    required this.title,
    required this.imgUrl,
    required this.url,
    this.show = true,
  });

  ChartInfo copyWith({
    ChartFunction? chartFunction,
    String? title,
    String? imgUrl,
    ChartURL? url,
    bool? show,
  }) {
    return ChartInfo(
      chartFunction: chartFunction ?? this.chartFunction,
      title: title ?? this.title,
      imgUrl: imgUrl ?? this.imgUrl,
      url: url ?? this.url,
      show: show ?? this.show,
    );
  }

  static final List<ChartInfo> chartInfoList = [
    ChartInfo(
      chartFunction: getSpotifyTop50Chart,
      imgUrl: spotifyRandomIMGs.getImage(),
      title: SpotifyCharts.TOP_50.title,
      url: SpotifyCharts.TOP_50,
    ),
    ChartInfo(
      chartFunction: getLastFmCharts,
      imgUrl: lastfmRandomIMGs.getImage(),
      title: LastFMCharts.TOP_TRACKS.title,
      url: LastFMCharts.TOP_TRACKS,
    ),
    ChartInfo(
      chartFunction: getMelonChart,
      imgUrl: melonRandomIMGs.getImage(),
      title: MelonCharts.DOMESTIC_DAILY.title,
      url: MelonCharts.DOMESTIC_DAILY,
    ),
    ChartInfo(
      chartFunction: getMelonChart,
      imgUrl: melonRandomIMGs.getImage(),
      title: MelonCharts.DOMESTIC_WEEKLY.title,
      url: MelonCharts.DOMESTIC_WEEKLY,
    ),
    ChartInfo(
      chartFunction: getMelonChart,
      imgUrl: melonRandomIMGs.getImage(),
      title: MelonCharts.DOMESTIC_MONTHLY.title,
      url: MelonCharts.DOMESTIC_MONTHLY,
    ),
    // ChartInfo(
    //   chartFunction: getMelonChart,
    //   imgUrl: melonRandomIMGs.getImage(),
    //   title: MelonCharts.GENREOMICS_DAILY.title,
    //   url: MelonCharts.GENREOMICS_DAILY,
    // ),
    // ChartInfo(
    //   chartFunction: getMelonChart,
    //   imgUrl: melonRandomIMGs.getImage(),
    //   title: MelonCharts.GENREOMICS_WEEKLY.title,
    //   url: MelonCharts.GENREOMICS_WEEKLY,
    // ),
    // ChartInfo(
    //   chartFunction: getMelonChart,
    //   imgUrl: melonRandomIMGs.getImage(),
    //   title: MelonCharts.GENREOMICS_MONTHLY.title,
    //   url: MelonCharts.GENREOMICS_MONTHLY,
    // ),
    ChartInfo(
        chartFunction: getBillboardChart,
        imgUrl: billboardRandomIMGs.getImage(),
        title: BillboardCharts.HOT_100.title,
        url: BillboardCharts.HOT_100),
    ChartInfo(
        chartFunction: getBillboardChart,
        imgUrl: billboardRandomIMGs.getImage(),
        title: BillboardCharts.BILLBOARD_200.title,
        url: BillboardCharts.BILLBOARD_200),
    ChartInfo(
        chartFunction: getBillboardChart,
        imgUrl: billboardRandomIMGs.getImage(),
        title: BillboardCharts.BILLBOARD_GLOBAL_200.title,
        url: BillboardCharts.BILLBOARD_GLOBAL_200),
    ChartInfo(
        chartFunction: getBillboardChart,
        imgUrl: billboardRandomIMGs.getImage(),
        title: BillboardCharts.KOREA_100.title,
        url: BillboardCharts.KOREA_100),
    ChartInfo(
        chartFunction: getBillboardChart,
        imgUrl: billboardRandomIMGs.getImage(),
        title: BillboardCharts.INDIA_SONGS.title,
        url: BillboardCharts.INDIA_SONGS),
    ChartInfo(
        chartFunction: getBillboardChart,
        imgUrl: billboardRandomIMGs.getImage(),
        title: BillboardCharts.JAPAN_HOT_100.title,
        url: BillboardCharts.JAPAN_HOT_100),
    ChartInfo(
        chartFunction: getBillboardChart,
        imgUrl: billboardRandomIMGs.getImage(),
        title: BillboardCharts.TIK_TOK_BILLBOARD_TOP_50.title,
        url: BillboardCharts.TIK_TOK_BILLBOARD_TOP_50),
  ];
}

class RandomIMGs {
  final List<String> imgURLs;
  RandomIMGs({required this.imgURLs});

  String getImage() {
    final random = Random();
    return imgURLs[random.nextInt(imgURLs.length)];
  }
}
