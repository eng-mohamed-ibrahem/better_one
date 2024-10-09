import 'dart:ui';

import 'package:better_one/core/constants/firebase_constants.dart';
import 'package:better_one/core/constants/notification_constants.dart';
import 'package:better_one/core/utils/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/notification_service/flutter_local_notification.dart';
import 'package:better_one/firebase_options.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class NotificationBackgroundService {
  void initializeService() async {
    final service = FlutterBackgroundService();
    var isRunning = await service.isRunning();
    if (isRunning) {
      kDebugPrint("service is already running");
      return;
    } else if (inject<LocaleUserInfo>().getUserData() != null) {
      await service.configure(
        iosConfiguration: IosConfiguration(
          autoStart: true,
          onForeground: onStart,
          onBackground: _onIosBackground,
        ),
        androidConfiguration: AndroidConfiguration(
          // this will be executed when app is in foreground or background in separated isolate
          onStart: onStart,
          // auto start service, once service configured
          autoStart: true,
          isForegroundMode: true,
          // this must match with notification channel you created in Flutter Locale Notificatiton.
          notificationChannelId: NotificaitonConstants.notificationChannelId,
          foregroundServiceNotificationId: 999,
          initialNotificationTitle: "Better One",
          initialNotificationContent: "Better One is running",
        ),
      );
    }
  }

  static void muteNotification() async {
    final service = FlutterBackgroundService();
    service.invoke(
      NotificaitonConstants.notificationService,
      {
        NotificaitonConstants.notificationAction:
            NotificaitonConstants.stopService,
      },
    );
  }

  static void unMuteNotification() {
    NotificationBackgroundService().initializeService();
  }

  @pragma('vm:entry-point')
  Future<bool> _onIosBackground(ServiceInstance service) async {
    WidgetsFlutterBinding.ensureInitialized();
    DartPluginRegistrant.ensureInitialized();

    return true;
  }

  @pragma('vm:entry-point')
  static void onStart(ServiceInstance service) async {
    DartPluginRegistrant.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // used to detect the first time load data from cloud firestore
    // so it dosen't display all data on cloud firestore once start listen
    //
    // ex: when the service is tart it begin to get all snapshot from cloud firestore
    // and it will display all data on cloud firestore
    // but i don't want this, i just want to listen after the first time load
    bool firstTimeListening = false;

    kDebugPrint("listening to notification");
    var flutterLocalNotification = FlutterLocalNotification();
    FirebaseFirestore.instance
        .collection(FirebaseConstants.usersNotifications)
        .orderBy('created_at', descending: true)
        .snapshots()
        .listen(
      (event) {
        kDebugPrint("notification: $firstTimeListening");
        if (firstTimeListening) {
          for (var element in event.docChanges) {
            if (element.type == DocumentChangeType.added ||
                element.type == DocumentChangeType.modified) {
              kDebugPrint("notification: ${element.doc.data()}");
              flutterLocalNotification.display(
                notification: NotificationModel.fromJson(element.doc.data()!),
              );
            }
          }
        }
        firstTimeListening = true;
      },
    );
    service.on(NotificaitonConstants.notificationService).listen((event) {
      kDebugPrint("notification: $event");
      if (event?[NotificaitonConstants.notificationAction] ==
          NotificaitonConstants.stopService) {
        kDebugPrint("notification service stopped");
        service.stopSelf();
      }
    });
  }
}