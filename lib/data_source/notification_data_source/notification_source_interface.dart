import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/model/task_model/task_model.dart';

abstract class NotificationSourceInterface {
  /// send notification
  Future<ResultHandler<bool, Failure>> sendNotification(
      NotificationModel notification);

  Future<ResultHandler<Stream<List<NotificationModel>>, Failure>>
      listenNotifications();

  Future<ResultHandler<List<NotificationModel>, Failure>> getNotifications(
      int limit,
      {bool loadMore = false});

  Future<ResultHandler<TaskModel, Failure>> getTaskFromNotification(
      {required String taskId, required String senderId});
}
