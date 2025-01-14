part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final bool autoUpdateNotify;
  final bool autoSlideCharts;
  final String downPath;
  final String downQuality;
  final String ytDownQuality;
  final String strmQuality;
  final String ytStrmQuality;
  final String backupPath;
  final bool autoBackup;
  final String historyClearTime;
  final bool autoGetCountry;
  final bool lFMPicks;
  final bool lastFMScrobble;
  final bool autoSaveLyrics;
  final String countryCode;
  final List<bool> sourceEngineSwitches;
  final Map chartMap;

  const SettingsState({
    required this.autoUpdateNotify,
    required this.autoSlideCharts,
    required this.downPath,
    required this.downQuality,
    required this.ytDownQuality,
    required this.strmQuality,
    required this.ytStrmQuality,
    required this.backupPath,
    required this.autoBackup,
    required this.historyClearTime,
    required this.autoGetCountry,
    required this.countryCode,
    required this.autoSaveLyrics,
    required this.lFMPicks,
    required this.lastFMScrobble,
    required this.sourceEngineSwitches,
    required this.chartMap,
  });

  SettingsState copyWith({
    bool? autoUpdateNotify,
    bool? autoSlideCharts,
    String? downPath,
    String? downQuality,
    String? ytDownQuality,
    String? strmQuality,
    String? ytStrmQuality,
    String? backupPath,
    bool? autoBackup,
    String? historyClearTime,
    bool? autoGetCountry,
    String? countryCode,
    bool? lFMPicks,
    bool? lastFMScrobble,
    List<bool>? sourceEngineSwitches,
    Map? chartMap,
    bool? autoSaveLyrics,
  }) {
    return SettingsState(
      autoUpdateNotify: autoUpdateNotify ?? this.autoUpdateNotify,
      autoSlideCharts: autoSlideCharts ?? this.autoSlideCharts,
      downPath: downPath ?? this.downPath,
      downQuality: downQuality ?? this.downQuality,
      ytDownQuality: ytDownQuality ?? this.ytDownQuality,
      strmQuality: strmQuality ?? this.strmQuality,
      ytStrmQuality: ytStrmQuality ?? this.ytStrmQuality,
      backupPath: backupPath ?? this.backupPath,
      autoBackup: autoBackup ?? this.autoBackup,
      historyClearTime: historyClearTime ?? this.historyClearTime,
      autoGetCountry: autoGetCountry ?? this.autoGetCountry,
      countryCode: countryCode ?? this.countryCode,
      lFMPicks: lFMPicks ?? this.lFMPicks,
      lastFMScrobble: lastFMScrobble ?? this.lastFMScrobble,
      sourceEngineSwitches: List.from(sourceEngineSwitches ?? this.sourceEngineSwitches),
      chartMap: Map.from(chartMap ?? this.chartMap),
      autoSaveLyrics: autoSaveLyrics ?? this.autoSaveLyrics,
    );
  }

  @override
  List<Object> get props => [
        autoUpdateNotify,
        autoSlideCharts,
        downPath,
        downQuality,
        ytDownQuality,
        strmQuality,
        ytStrmQuality,
        backupPath,
        autoBackup,
        historyClearTime,
        autoGetCountry,
        countryCode,
        sourceEngineSwitches,
        chartMap,
        lFMPicks,
        lastFMScrobble,
        autoSaveLyrics,
      ];
}

class SettingsInitial extends SettingsState {
  SettingsInitial()
      : super(
          autoUpdateNotify: false,
          autoSlideCharts: true,
          downPath: "",
          downQuality: "320 kbps",
          ytDownQuality: "High",
          strmQuality: "96 kbps",
          ytStrmQuality: "Low",
          backupPath: "",
          autoBackup: true,
          historyClearTime: "30",
          autoGetCountry: true,
          countryCode: "IN",
          sourceEngineSwitches: SourceEngine.values.map((e) => true).toList(),
          chartMap: {},
          lFMPicks: false,
          lastFMScrobble: true,
          autoSaveLyrics: false,
        );
}
