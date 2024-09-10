import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class NotificationSourceInterface {
  /// send notification
  Future<ResultHandler<bool, Failure>> sendNotification(
      NotificationModel notification);

  Future<ResultHandler<Stream<List<NotificationModel>>, Failure>>
      listenNotifications();

  Future<ResultHandler<List<QueryDocumentSnapshot>, Failure>> getNotifications(
      int limit,
      {QueryDocumentSnapshot? startAfter});
}
