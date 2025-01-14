import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '../../../models/source_engines.dart';
import '../../../service/app_database_service.dart';
import '../../route/global_str_consts.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial()) {
    initSettings();
    autoUpdate();
  }

// Initialize the settings from the database
  void initSettings() {
    AppDatabaseService.getSettingBool(GlobalStrConsts.autoUpdateNotify).then((value) {
      emit(state.copyWith(autoUpdateNotify: value ?? false));
    });

    AppDatabaseService.getSettingBool(GlobalStrConsts.autoSlideCharts).then((value) {
      emit(state.copyWith(autoSlideCharts: value ?? true));
    });

    // Directory dir = Directory('/storage/emulated/0/Music');
    String? path;

    AppDatabaseService.getSettingStr(GlobalStrConsts.downPathSetting).then((value) async {
      await getDownloadsDirectory().then((value) {
        if (value != null) {
          path = value.path;
        }
      });
      emit(state.copyWith(downPath: (value ?? path) ?? (await getApplicationDocumentsDirectory()).path));
    });

    AppDatabaseService.getSettingStr(GlobalStrConsts.downQuality, defaultValue: '320 kbps').then((value) {
      emit(state.copyWith(downQuality: value ?? "320 kbps"));
    });

    AppDatabaseService.getSettingStr(GlobalStrConsts.ytDownQuality).then((value) {
      emit(state.copyWith(ytDownQuality: value ?? "High"));
    });

    AppDatabaseService.getSettingStr(
      GlobalStrConsts.strmQuality,
    ).then((value) {
      emit(state.copyWith(strmQuality: value ?? "96 kbps"));
    });

    AppDatabaseService.getSettingStr(GlobalStrConsts.ytStrmQuality).then((value) {
      if (value == "High" || value == "Low") {
        emit(state.copyWith(ytStrmQuality: value ?? "Low"));
      } else {
        AppDatabaseService.putSettingStr(GlobalStrConsts.ytStrmQuality, "Low");
        emit(state.copyWith(ytStrmQuality: "Low"));
      }
    });

    AppDatabaseService.getSettingStr(GlobalStrConsts.historyClearTime).then((value) {
      emit(state.copyWith(historyClearTime: value ?? "30"));
    });

    AppDatabaseService.getSettingBool(GlobalStrConsts.lFMScrobbleSetting).then((value) {
      emit(state.copyWith(lastFMScrobble: value ?? false));
    });

    AppDatabaseService.getSettingBool(GlobalStrConsts.lFMUIPicks).then((value) {
      emit(state.copyWith(lFMPicks: value ?? false));
    });

    AppDatabaseService.getSettingStr(GlobalStrConsts.backupPath).then((value) async {
      if (value == null || value == "") {
        await AppDatabaseService.putSettingStr(
            GlobalStrConsts.backupPath, (await getApplicationDocumentsDirectory()).path);
        emit(state.copyWith(backupPath: (await getApplicationDocumentsDirectory()).path));
      } else {
        emit(state.copyWith(backupPath: value));
      }
    });

    AppDatabaseService.getSettingBool(GlobalStrConsts.autoBackup).then((value) {
      emit(state.copyWith(autoBackup: value ?? false));
    });

    AppDatabaseService.getSettingBool(GlobalStrConsts.autoGetCountry).then((value) {
      emit(state.copyWith(autoGetCountry: value ?? false));
    });

    AppDatabaseService.getSettingStr(GlobalStrConsts.countryCode).then((value) {
      emit(state.copyWith(countryCode: value ?? "IN"));
    });

    AppDatabaseService.getSettingBool(GlobalStrConsts.autoSaveLyrics).then((value) {
      emit(state.copyWith(autoSaveLyrics: value ?? false));
    });

    for (var eg in SourceEngine.values) {
      AppDatabaseService.getSettingBool(eg.value).then((value) {
        List<bool> switches = List.from(state.sourceEngineSwitches);
        switches[SourceEngine.values.indexOf(eg)] = value ?? true;
        emit(state.copyWith(sourceEngineSwitches: switches));
        log(switches.toString(), name: 'SettingsCubit');
      });
    }

    Map chartMap = Map.from(state.chartMap);
    AppDatabaseService.getSettingStr(GlobalStrConsts.chartShowMap).then((value) {
      if (value != null) {
        chartMap = jsonDecode(value);
      }
      emit(state.copyWith(chartMap: Map.from(chartMap)));
    });
  }

  void setChartShow(String title, bool value) {
    Map chartMap = Map.from(state.chartMap);
    chartMap[title] = value;
    AppDatabaseService.putSettingStr(GlobalStrConsts.chartShowMap, jsonEncode(chartMap));
    emit(state.copyWith(chartMap: Map.from(chartMap)));
  }

  void autoUpdate() {
    AppDatabaseService.getSettingBool(GlobalStrConsts.autoBackup).then((value) {
      if (value != null || value == true) {
        AppDatabaseService.createBackUp();
      }
    });
  }

  void setCountryCode(String value) {
    AppDatabaseService.putSettingStr(GlobalStrConsts.countryCode, value);
    emit(state.copyWith(countryCode: value));
  }

  void setAutoSaveLyrics(bool value) {
    AppDatabaseService.putSettingBool(GlobalStrConsts.autoSaveLyrics, value);
    emit(state.copyWith(autoSaveLyrics: value));
  }

  void setLastFMScrobble(bool value) {
    AppDatabaseService.putSettingBool(GlobalStrConsts.lFMScrobbleSetting, value);
    emit(state.copyWith(lastFMScrobble: value));
  }

  void setLastFMExpore(bool value) {
    AppDatabaseService.putSettingBool(GlobalStrConsts.lFMUIPicks, value);
    emit(state.copyWith(lFMPicks: value));
  }

  void setAutoGetCountry(bool value) {
    AppDatabaseService.putSettingBool(GlobalStrConsts.autoGetCountry, value);
    emit(state.copyWith(autoGetCountry: value));
  }

  void setAutoUpdateNotify(bool value) {
    AppDatabaseService.putSettingBool(GlobalStrConsts.autoUpdateNotify, value);
    emit(state.copyWith(autoUpdateNotify: value));
  }

  void setAutoSlideCharts(bool value) {
    AppDatabaseService.putSettingBool(GlobalStrConsts.autoSlideCharts, value);
    emit(state.copyWith(autoSlideCharts: value));
  }

  void setDownPath(String value) {
    AppDatabaseService.putSettingStr(GlobalStrConsts.downPathSetting, value);
    emit(state.copyWith(downPath: value));
  }

  void setDownQuality(String value) {
    AppDatabaseService.putSettingStr(GlobalStrConsts.downQuality, value);
    emit(state.copyWith(downQuality: value));
  }

  void setYtDownQuality(String value) {
    AppDatabaseService.putSettingStr(GlobalStrConsts.ytDownQuality, value);
    emit(state.copyWith(ytDownQuality: value));
  }

  void setStrmQuality(String value) {
    AppDatabaseService.putSettingStr(GlobalStrConsts.strmQuality, value);
    emit(state.copyWith(strmQuality: value));
  }

  void setYtStrmQuality(String value) {
    AppDatabaseService.putSettingStr(GlobalStrConsts.ytStrmQuality, value);
    emit(state.copyWith(ytStrmQuality: value));
  }

  void setBackupPath(String value) {
    AppDatabaseService.putSettingStr(GlobalStrConsts.backupPath, value);
    emit(state.copyWith(backupPath: value));
  }

  void setAutoBackup(bool value) {
    AppDatabaseService.putSettingBool(GlobalStrConsts.autoBackup, value);
    emit(state.copyWith(autoBackup: value));
  }

  void setHistoryClearTime(String value) {
    AppDatabaseService.putSettingStr(GlobalStrConsts.historyClearTime, value);
    emit(state.copyWith(historyClearTime: value));
  }

  void setSourceEngineSwitches(int index, bool value) {
    List<bool> switches = List.from(state.sourceEngineSwitches);
    switches[index] = value;
    AppDatabaseService.putSettingBool(SourceEngine.values[index].value, value);
    emit(state.copyWith(sourceEngineSwitches: List.from(switches)));
  }

  Future<void> resetDownPath() async {
    String? path;

    await getDownloadsDirectory().then((value) {
      if (value != null) {
        path = value.path;
        log(path.toString(), name: 'SettingsCubit');
      }
    });

    if (path != null) {
      AppDatabaseService.putSettingStr(GlobalStrConsts.downPathSetting, path!);
      emit(state.copyWith(downPath: path));
      log(path.toString(), name: 'SettingsCubit');
    } else {
      log("Path is null", name: 'SettingsCubit');
    }
  }
}
