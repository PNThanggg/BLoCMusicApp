import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/local/notification_database.dart';
import '../../../service/app_database_service.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  StreamSubscription? _subscription;

  NotificationCubit() : super(NotificationInitial()) {
    // getLatestVersion().then((value) {
    //   if (value["results"]) {
    //     if (int.parse(value["currBuild"]) < int.parse(value["newBuild"])) {
    //       BloomeeDBService.putNotification(
    //         title: "Update Available",
    //         body: "New Version of Bloomee🌸 is now available!! Version: ${value["newVer"]} + ${value["newBuild"]}",
    //         type: "app_update",
    //         unique: true,
    //       );
    //     }
    //   }
    // });

    getNotification();
  }

  void getNotification() async {
    List<NotificationDatabase> notifications = await AppDatabaseService.getNotifications();
    emit(NotificationState(notifications: notifications));
  }

  void clearNotification() {
    AppDatabaseService.clearNotifications();
    getNotification();
  }

  Future<void> watchNotification() async {
    _subscription = (await AppDatabaseService.watchNotification()).listen((event) {
      getNotification();
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
