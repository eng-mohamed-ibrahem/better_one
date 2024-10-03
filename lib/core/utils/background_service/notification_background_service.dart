import 'dart:ui';

import 'package:better_one/core/constants/firebase_constants.dart';
import 'package:better_one/core/constants/notification_constants.dart';
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
    // service.startService();
    // service.invoke('notification_service', {'action': 'stop_service'});
    var isRunning = await service.isRunning();
    if (isRunning) {
      kDebugPrint("service is already running");
      return;
    } else {
      await service.configure(
        iosConfiguration: IosConfiguration(
          autoStart: true,
          onForeground: onStart,
          onBackground: onIosBackground,
        ),
        androidConfiguration: AndroidConfiguration(
          // this will be executed when app is in foreground or background in separated isolate
          onStart: onStart,
          // auto start service
          autoStart: true,
          isForegroundMode: true,
          // this must match with notification channel you created in Flutter Locale Notificatiton.
          notificationChannelId: NotificaitonConstants.notificationChannelId,
          foregroundServiceNotificationId: 999,
        ),
      );
    }
  }

  @pragma('vm:entry-point')
  Future<bool> onIosBackground(ServiceInstance service) async {
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

    bool firstTimeListening = false;
    kDebugPrint("listening to notification");
    var flutterLocalNotification = FlutterLocalNotification();
    FirebaseFirestore.instance
        .collection(FirebaseConstants.completeNotifications)
        .orderBy('created_at', descending: true)
        .snapshots()
        .listen(
      (event) {
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
      if (event?[NotificaitonConstants.notificationAction] == NotificaitonConstants.stopService) {
        service.stopSelf();
      }
    });
  }
}
