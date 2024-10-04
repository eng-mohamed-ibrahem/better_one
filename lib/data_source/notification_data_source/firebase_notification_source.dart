import 'package:better_one/core/constants/firebase_constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/data_source/notification_data_source/notification_source_interface.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseNotificationSource implements NotificationSourceInterface {
  @override
  Future<ResultHandler<bool, Failure>> sendNotification(
      NotificationModel notification) async {
    try {
      var db = FirebaseFirestore.instance;
      await db
          .collection(FirebaseConstants.usersNotifications)
          .doc(notification.payload)
          .set(notification.toJson());
      return const ResultHandler.success(data: true);
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<Stream<List<NotificationModel>>, Failure>>
      listenNotifications() async {
    try {
      var db = FirebaseFirestore.instance;
      var stream = db
          .collection(FirebaseConstants.usersNotifications)
          .snapshots()
          .map(
        (event) {
          return event.docs
              .map((e) => NotificationModel.fromJson(e.data()))
              .toList();
        },
      );
      return ResultHandler.success(data: stream);
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<List<QueryDocumentSnapshot>, Failure>> getNotifications(
    int limit, {
    QueryDocumentSnapshot? startAfter,
  }) async {
    try {
      var db = FirebaseFirestore.instance;
      var query = db
          .collection(FirebaseConstants.usersNotifications)
          .orderBy('created_at', descending: true)
          .limit(limit);

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }
      var querySnapshot = await query.get();

      return ResultHandler.success(data: querySnapshot.docs);
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }
}
