import 'dart:isolate';
import 'dart:ui';

import 'package:better_one/core/constants/firebase_constants.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/notification_service/flutter_local_notification.dart';
import 'package:better_one/firebase_options.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationBackgroundService {
  static void listenToNotification(RootIsolateToken? token) async {
    await Isolate.spawn(_listenToNotificationEntryPoint, token!);
  }

  @pragma('vm:entry-point')
  static void _listenToNotificationEntryPoint(RootIsolateToken token) async {
    DartPluginRegistrant.ensureInitialized();
    BackgroundIsolateBinaryMessenger.ensureInitialized(token);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    kDebugPrint("listening to notification");
    var flutterLocalNotification = FlutterLocalNotification();
    await flutterLocalNotification.init();
    FirebaseFirestore.instance
        .collection(FirebaseConstants.completeNotifications)
        .snapshots()
        .listen(
      (event) {
        // Isolate.current.kill();
        for (var element in event.docChanges) {
          if (element.type == DocumentChangeType.added ||
              element.type == DocumentChangeType.modified) {
            kDebugPrint("notification: ${element.doc.data()}");
            flutterLocalNotification.display(
              notification: NotificationModel.fromJson(element.doc.data()!),
            );
          }
        }
      },
    );
  }
}

class CustomBinaryMessenger implements BinaryMessenger {
  CustomBinaryMessenger() {
    WidgetsFlutterBinding.ensureInitialized();
  }
  final _servicesBinding = ServicesBinding.instance.defaultBinaryMessenger;
  @override
  Future<void> handlePlatformMessage(String channel, ByteData? data,
      PlatformMessageResponseCallback? callback) {
    return _servicesBinding.handlePlatformMessage(channel, data, callback);
  }

  @override
  Future<ByteData?>? send(String channel, ByteData? message) {
    return _servicesBinding.send(channel, message);
  }

  @override
  void setMessageHandler(String channel, MessageHandler? handler) {
    _servicesBinding.setMessageHandler(channel, handler);
  }
}
