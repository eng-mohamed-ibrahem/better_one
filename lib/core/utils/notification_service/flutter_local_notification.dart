import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:better_one/core/constants/notification_constants.dart';
import 'package:better_one/core/enum/notification_interval.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class FlutterLocalNotification {
  final FlutterLocalNotificationsPlugin _flutterNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    AndroidInitializationSettings android =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings ios = DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) {
        _ontTapNotificationStreamController.add(payload);
      },
    );
    InitializationSettings settings = InitializationSettings(
      android: android,
      iOS: ios,
    );
    await _flutterNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: _onTapWhileAppRunning,
    );

    /// used for notification background service
    await _flutterNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    NotificationConstants.notificationChannelId,
    'MY FOREGROUND SERVICE',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  final StreamController<String?> _ontTapNotificationStreamController =
      StreamController.broadcast();

  Stream<String?> get onTapNotificationStream =>
      _ontTapNotificationStreamController.stream;

  void _onTapWhileAppRunning(NotificationResponse notificationResponse) {
    _ontTapNotificationStreamController.add(notificationResponse.payload);
  }

  Future<NotificationAppLaunchDetails?>
      get getNotificationAppLaunchDetails async {
    return await _flutterNotificationsPlugin.getNotificationAppLaunchDetails();
  }

  NotificationDetails notificationDetails = const NotificationDetails(
    android: AndroidNotificationDetails(
      NotificationConstants.notificationChannelId,
      'channel_name',
      channelDescription: 'This channel is used for important notifications.',
      priority: Priority.high,
      importance: Importance.max,
    ),
    iOS: DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    ),
  );

  Future<void> display({
    required NotificationModel notification,
  }) async {
    await _flutterNotificationsPlugin.show(
      notification.comment.hashCode,
      notification.userName,
      notification.comment,
      notificationDetails,
      payload: jsonEncode({
        NotificationConstants.taskId: notification.payload,
        NotificationConstants.senderId: notification.senderId
      }),
    );

    // _flutterNotificationsPlugin
    //     .resolvePlatformSpecificImplementation<
    //         AndroidFlutterLocalNotificationsPlugin>()
    //     ?.areNotificationsEnabled();

    // await requestPermissions().then((status) async {
    //   log('request permission status: $status');
    //   if (status == null || status == true) {
    //     await _flutterNotificationsPlugin.show(
    //       notification.comment.hashCode,
    //       notification.userName,
    //       notification.comment,
    //       notificationDetails,
    //       payload: notification.payload,
    //     );
    //   }
    // });
  }

  Future<void> displayRepeated({
    required NotificationModel notification,
    required NotificaionInterval interval,
  }) async {
    await requestPermissions().then((status) async {
      if (status == null || status == true) {
        await _flutterNotificationsPlugin.periodicallyShow(
          notification.comment.hashCode,
          notification.userName,
          notification.comment,
          RepeatInterval.values[interval.index],
          notificationDetails,
          payload: notification.payload,
        );
      }
    });
  }

  Future<void> displaySchedule({
    required NotificationModel notification,
    required DateTime scheduleTime,
    bool repeatDaysWithSameTime = false,
  }) async {
    await requestPermissions().then(
      (status) async {
        if (status == null || status == true) {
          tz.initializeTimeZones();
          var timezoneName = await FlutterTimezone.getLocalTimezone();
          tz.setLocalLocation(tz.getLocation(timezoneName));
          await _flutterNotificationsPlugin.zonedSchedule(
            notification.comment.hashCode,
            notification.userName,
            notification.comment,
            tz.TZDateTime(
              tz.local,
              scheduleTime.year,
              scheduleTime.month,
              scheduleTime.day,
              scheduleTime.hour,
              scheduleTime.minute,
              scheduleTime.second,
            ),
            notificationDetails,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime,
            matchDateTimeComponents:
                repeatDaysWithSameTime ? DateTimeComponents.time : null,
            payload: notification.payload,
          );
        }
      },
    );
  }

  Future<void> cancel({required int id}) async {
    await _flutterNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAll() async {
    await _flutterNotificationsPlugin.cancelAll();
  }

  /// handle request permission for android[>13 || API 33] and ios
  Future<bool?> requestPermissions() async {
    if (Platform.isAndroid) {
      return await _flutterNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()!
          .requestNotificationsPermission();
    } else if (Platform.isIOS) {
      return await _flutterNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()!
          .requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    }
    return null;
  }

  Future<List<int>> getActiveNotificationsIds() async {
    return await _flutterNotificationsPlugin
        .getActiveNotifications()
        .then((value) => value.map((e) => e.id!).toList());
  }

  Future<List<int>> getPendingNotificationsIds() async {
    return await _flutterNotificationsPlugin
        .pendingNotificationRequests()
        .then((value) => value.map((e) => e.id).toList());
  }
}
