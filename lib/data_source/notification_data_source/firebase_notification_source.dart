import 'package:better_one/core/constants/firebase_constants.dart';
import 'package:better_one/core/constants/notification_constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/in_memory/in_memory.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/data_source/notification_data_source/notification_source_interface.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseNotificationSource implements NotificationSourceInterface {
  @override
  Future<ResultHandler<bool, Failure>> sendNotification(
      NotificationModel notification) async {
    try {
      var db = FirebaseFirestore.instance;
      await db
          .collection(FirebaseConstants.usersNotifications)
          .doc()
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
      var stream =
          db.collection(FirebaseConstants.usersNotifications).snapshots().map(
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
  Future<ResultHandler<List<NotificationModel>, Failure>> getNotifications(
    int limit, {
    bool loadMore = false,
  }) async {
    try {
      var db = FirebaseFirestore.instance;
      var queryData =
          await db.collection(FirebaseConstants.usersNotifications).get();

      if (queryData.docs.isEmpty) {
        return const ResultHandler.success(data: []);
      }
      var query = db
          .collection(FirebaseConstants.usersNotifications)
          .orderBy('created_at', descending: true);

      if (loadMore) {
        var lastDocument = InMemory()
            .getData<QueryDocumentSnapshot>(NotificationConstants.lasDocument);
        query = query.startAfterDocument(lastDocument);
      }
      var querySnapshot = await query.limit(limit).get();
      InMemory().addData<QueryDocumentSnapshot>(
          NotificationConstants.lasDocument, querySnapshot.docs.last);
      InMemory().addData<bool>(
          NotificationConstants.hasMore, querySnapshot.docs.length == limit);

      return ResultHandler.success(
        data: querySnapshot.docs
            .map(
              (e) => NotificationModel.fromJson(e.data()),
            )
            .toList(),
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<TaskModel, Failure>> getTaskFromNotification(
      {required String taskId, required String senderId}) async {
    try {
      var db = FirebaseFirestore.instance;
      var doc = await db
          .collection(FirebaseConstants.users)
          .doc(senderId)
          .collection(FirebaseConstants.tasks)
          .doc(taskId)
          .get();
      kDebugPrint(
        "task id $taskId sender id $senderId" 'doc data ${doc.exists}',
      );
      return ResultHandler.success(data: TaskModel.fromJson(doc.data()!));
    } on FormatException catch (e) {
      return ResultHandler.failure(error: ParserFailure(message: e.message));
    } catch (e) {
      kDebugPrint("Task from Notification exception:$e");
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }
}
