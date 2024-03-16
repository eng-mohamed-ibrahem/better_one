import 'package:better_one/core/enum/notification_interval.dart';
import 'package:better_one/model/notification_model/notification_model.dart';

abstract class NotificationRepoInterface {
  /// intialize notification
  Future<void> init();

  /// display notification
  Future<void> display({
    required NotificationModel notification,
  });

  /// display repeated
  Future<void> displayRepeated({
    required NotificationModel notification,
    required NotificaionInterval interval,
  });

  /// display schedule
  Future<void> displaySchedule({
    required NotificationModel notification,
    required DateTime scheduleTime,
    bool repeatDaysWithSameTime = false,
  });

  /// stream of payload on tap while app running
  Stream<String?> get onTapNotificationStream;

  /// get notification app launch details
  Future get getNotificationAppLaunchDetails;

  Future<List<int>> getActiveNotificationsIds();

  Future<List<int>> getPendingNotificationsIds();

  /// cancel notification by id
  Future<void> cancel({required int id});

  /// cancel all notification
  Future<void> cancelAll();
}
