import 'dart:io';
import 'dart:ui';

import 'package:better_one/core/constants/firebase_constants.dart';
import 'package:better_one/core/constants/notification_constants.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/notification_service/flutter_local_notification.dart';
import 'package:better_one/core/utils/service/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/service/notification_service/notification_background_service_interface.dart';
import 'package:better_one/firebase_options.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

// The callback function should always be a top-level or static function.
@pragma('vm:entry-point')
void startCallback() {
  kDebugPrint('startCallback');
  FlutterForegroundTask.setTaskHandler(NotificationHandler());
}

class ForegroundTaskNotificationService
    implements NotificationBackgroundService {
  @override
  void initializeAndStartService() async {
    // Initialize port for communication between TaskHandler and UI.
    FlutterForegroundTask.initCommunicationPort();
    _requestPermissions();
    _initService();

    if (inject<LocaleUserInfo>().getUserData() != null) {
      settingRepo.getNotificationSettings().then(
        (notificationSettings) {
          notificationSettings.when(
            success: (data) {
              if (data.muteNotification) {
                _stopService();
              } else {
                _startService();
              }
            },
            failure: (failure) {
              _startService();
            },
          );
        },
      );
    }
  }

  Future<void> _requestPermissions() async {
    // Android 13+, you need to allow notification permission to display foreground service notification.
    //
    // iOS: If you need notification, ask for permission.
    final NotificationPermission notificationPermission =
        await FlutterForegroundTask.checkNotificationPermission();
    if (notificationPermission != NotificationPermission.granted) {
      await FlutterForegroundTask.requestNotificationPermission();
    }

    if (Platform.isAndroid) {
      // Android 12+, there are restrictions on starting a foreground service.
      //
      // To restart the service on device reboot or unexpected problem, you need to allow below permission.
      if (!await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
        // This function requires `android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` permission.
        await FlutterForegroundTask.requestIgnoreBatteryOptimization();
      }

      // Use this utility only if you provide services that require long-term survival,
      // such as exact alarm service, healthcare service, or Bluetooth communication.
      //
      // This utility requires the "android.permission.SCHEDULE_EXACT_ALARM" permission.
      // Using this permission may make app distribution difficult due to Google policy.
      if (!await FlutterForegroundTask.canScheduleExactAlarms) {
        // When you call this function, will be gone to the settings page.
        // So you need to explain to the user why set it.
        await FlutterForegroundTask.openAlarmsAndRemindersSettings();
      }
    }
  }

  void _initService() {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: NotificationConstants.notificationChannelId,
        channelName: 'Foreground Service Notification',
        channelDescription:
            'This notification appears when the foreground service is running.',
        onlyAlertOnce: true,
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: false,
        playSound: false,
      ),
      foregroundTaskOptions: ForegroundTaskOptions(
        eventAction: ForegroundTaskEventAction.nothing(),
        autoRunOnBoot: true,
        autoRunOnMyPackageReplaced: true,
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );
  }

  Future<ServiceRequestResult> _startService() async {
    if (await FlutterForegroundTask.isRunningService) {
      return await FlutterForegroundTask.restartService();
    } else {
      kDebugPrint("start service");
      return await FlutterForegroundTask.startService(
        serviceId: 256,
        notificationTitle: 'Better One',
        notificationText: 'We Are Here, For You',
        notificationIcon: null,
        // notificationButtons: [
        //   const NotificationButton(id: 'btn_hello', text: 'hello'),
        // ],
        // notificationInitialRoute: '/second',
        callback: startCallback,
      );
    }
  }

  Future<ServiceRequestResult> _stopService() {
    return FlutterForegroundTask.stopService();
  }

  @override
  void muteNotification() async {
    await _stopService();
  }

  @override
  void stopService() async {
    await _stopService();
  }

  @override
  void unMuteNotification() async {
    await _startService();
  }
}

class NotificationHandler extends TaskHandler {
  // Called when the task is started.
  @override
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
    kDebugPrint('onStart(starter: ${starter.name})');
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
  }

  // Called based on the eventAction set in ForegroundTaskOptions.
  @override
  void onRepeatEvent(DateTime timestamp) {
    // Update notification content.
    // FlutterForegroundTask.updateService(
    //   notificationTitle: 'Hello NotificationHandler :)',
    //   notificationText: 'count data',
    // );
    kDebugPrint("on Repeat Event");
  }

  // Called when the task is destroyed.
  @override
  Future<void> onDestroy(DateTime timestamp) async {
    kDebugPrint('onDestroy');
  }

  // Called when data is sent using `FlutterForegroundTask.sendDataToTask`.
  @override
  void onReceiveData(Object data) {
    // data as String
    kDebugPrint('onReceiveData: $data');
    if (data == "increment") {
      // _incrementCount();
    }
  }

  // Called when the notification button is pressed.
  @override
  void onNotificationButtonPressed(String id) {
    kDebugPrint('onNotificationButtonPressed: $id');
  }

  // Called when the notification itself is pressed.
  @override
  void onNotificationPressed() {
    kDebugPrint('onNotificationPressed');
  }

  // Called when the notification itself is dismissed.
  @override
  void onNotificationDismissed() {
    kDebugPrint('onNotificationDismissed');
  }
}
