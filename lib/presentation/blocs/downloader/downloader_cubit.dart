import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../models/media_item_model.dart';
import '../../../service/app_database_service.dart';
import '../../../service/snack_bar_service.dart';
import '../../../utils/app_downloader.dart';
import '../../route/global_str_consts.dart';
import '../internet_connectivity/connectivity_cubit.dart';

part 'downloader_state.dart';

class DownTask {
  final String taskId;
  final MediaItemModel song;
  final String filePath;
  final String fileName;

  DownTask({
    required this.taskId,
    required this.song,
    required this.filePath,
    required this.fileName,
  });
}

Future<bool> storagePermission() async {
  final DeviceInfoPlugin info = DeviceInfoPlugin();
  final AndroidDeviceInfo androidInfo = await info.androidInfo;
  final int androidVersion = int.parse(androidInfo.version.release);
  bool havePermission = false;

  if (androidVersion >= 13) {
    final request = await [
      Permission.videos,
      Permission.photos,
    ].request();

    havePermission = request.values.every((status) => status == PermissionStatus.granted);
  } else {
    final status = await Permission.storage.request();
    havePermission = status.isGranted;
  }

  if (!havePermission) {
    await openAppSettings();
  }

  return havePermission;
}

class DownloaderCubit extends Cubit<DownloaderState> {
  static bool isInitialized = false;
  ConnectivityCubit connectivityCubit;
  static List<DownTask> downloadedSongs = List.empty(growable: true);
  static late String downPath;
  static ReceivePort receivePort = ReceivePort();

  DownloaderCubit({required this.connectivityCubit}) : super(DownloaderInitial()) {
    if (!isInitialized && Platform.isAndroid) {
      initDownloader().then((value) => isInitialized = true);
    }
  }

  Future<void> initDownPath() async {
    downPath = (await AppDatabaseService.getSettingStr(GlobalStrConsts.downPathSetting,
        defaultValue: (await getDownloadsDirectory())!.path))!;
  }

  Future<String> getDownPath() async {
    return (await AppDatabaseService.getSettingStr(
      GlobalStrConsts.downPathSetting,
      defaultValue: (await getDownloadsDirectory())!.path,
    ))!;
  }

  Future<void> initDownloader() async {
    await initDownPath();
    await FlutterDownloader.initialize(
        debug: true, // optional: set to false to disable printing logs to console (default: true)
        ignoreSsl: true // option: set to false to disable working with http links (default: false)
        );

    bool isSuccess = IsolateNameServer.registerPortWithName(receivePort.sendPort, "download_port");
    if (!isSuccess) {
      IsolateNameServer.removePortNameMapping("download_port");
      IsolateNameServer.registerPortWithName(receivePort.sendPort, "download_port");
    }
    FlutterDownloader.registerCallback(callback);

    receivePort.listen((dynamic data) async {
      final String taskId = data[0];
      final int status = data[1];
      DownTask? downTask;
      try {
        downTask = downloadedSongs.firstWhere((element) => element.taskId == taskId);
      } catch (e) {
        log("Task not found", error: e, name: "DownloaderCubit");
      }
      if (downTask != null) {
        if (status == DownloadTaskStatus.complete.index) {
          downloadedSongs.remove(downTask);
          if (downTask.song.extras!['source'] != 'youtube') {
            File file = File(downTask.filePath);
            if (file.existsSync()) {
              await file.rename(downTask.filePath.replaceAll(".mp4", ".m4a"));
            }
          }

          AppDatabaseService.putDownloadDB(
            fileName: downTask.fileName,
            filePath: downTask.filePath,
            lastDownloaded: DateTime.now(),
            mediaItem: downTask.song,
          );
          SnackBarService.showMessage("Downloaded ${downTask.song.title}");
        } else if (status == DownloadTaskStatus.failed.index) {
          downloadedSongs.remove(downTask);
          SnackBarService.showMessage("Failed to download ${downTask.song.title}");
          log("Failed to download ${downTask.song.title}", name: "DownloaderCubit");
        } else {}
      }
    });
  }

  Future<void> downloadSong(MediaItemModel song) async {
    await storagePermission();

    if (isInitialized && connectivityCubit.state == ConnectivityState.connected) {
      if (downloadedSongs.any((element) => element.song.extras!['url'] == song.extras!['url'])) {
        log("${song.title} already added to download queue", name: "DownloaderCubit");
        SnackBarService.showMessage("${song.title} already added to download queue");
        return;
      }
      downPath = await getDownPath();
      String fileName;
      if (song.extras!['source'] != 'youtube') {
        fileName = "${song.title} by ${song.artist}.mp4".replaceAll('?', '-').replaceAll('/', '-');
      } else {
        fileName = "${song.title} by ${song.artist}.m4a".replaceAll('?', '-').replaceAll('/', '-');
      }
      fileName = await AppDownloader.getValidFileName(fileName, downPath);
      log('downloading $fileName', name: "DownloaderCubit");
      final String? taskId = await AppDownloader.downloadSong(
        song,
        fileName: fileName,
        filePath: downPath,
      );
      if (taskId != null) {
        SnackBarService.showMessage("Added ${song.title} to download queue");

        downloadedSongs.add(
          DownTask(
            taskId: taskId,
            song: song,
            filePath: downPath,
            fileName: fileName,
          ),
        );
      }
    } else {
      SnackBarService.showMessage("No internet connection or download service not initialized");
    }
  }
}

@pragma('vm:entry-point')
Future callback(String taskId, int status, int progress) async {
  final SendPort? send = IsolateNameServer.lookupPortByName('download_port');
  send?.send([taskId, status, progress]);
}
