import 'package:better_one/core/constants/firebase_constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/data_source/user_data_source/remote_user_source.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/model/user_model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRemoteUserSource implements RemoteUserSource {
  @override
  Future<ResultHandler<TaskModel, Failure>> addTask(TaskModel newTask) async {
    try {
      String? userId = userLocaleDatabase.getUserIdFromLocale();
      var db = FirebaseFirestore.instance;
      db
          .collection(FirebaseConstants.users)
          .doc(userId)
          .collection(FirebaseConstants.tasks)
          .doc(newTask.id)
          .set(newTask.copyWith(backup: true).toJson());
      return ResultHandler.success(data: newTask);
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<TaskModel, Failure>> getTaskById(String id) async {
    try {
      String? userId = userLocaleDatabase.getUserIdFromLocale();
      var db = FirebaseFirestore.instance;
      var doc = await db
          .collection(FirebaseConstants.users)
          .doc(userId)
          .collection(FirebaseConstants.tasks)
          .doc(id)
          .get();
      return ResultHandler.success(data: TaskModel.fromJson(doc.data()!));
    } on FormatException catch (e) {
      return ResultHandler.failure(error: ParserFailure(message: e.message));
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<UserModel, Failure>> getUserDetails() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw FirebaseAuthException(code: 'no-user');
      }
      UserModel userModel = UserModel(
        id: user.uid,
        name: user.displayName!,
        email: user.email!,
        createdAt: user.metadata.creationTime!,
      );
      return ResultHandler.success(data: userModel);
    } on FirebaseAuthException catch (e) {
      return ResultHandler.failure(
        error: FirebaseFailure.fromCode(e.code),
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<bool, Failure>> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return const ResultHandler.success(data: true);
    } on FirebaseAuthException catch (e) {
      return ResultHandler.failure(
        error: FirebaseFailure.fromCode(e.code),
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<TaskModel, Failure>> removeTask(
      TaskModel removedTask) async {
    try {
      String? userId = userLocaleDatabase.getUserIdFromLocale();
      var db = FirebaseFirestore.instance;
      await db
          .collection(FirebaseConstants.users)
          .doc(userId)
          .collection(FirebaseConstants.tasks)
          .doc(removedTask.id)
          .delete();
      return ResultHandler.success(data: removedTask);
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<TaskModel, Failure>> updateTask(
      TaskModel oldTask, TaskModel newTask) async {
    try {
      String? userId = userLocaleDatabase.getUserIdFromLocale();
      var db = FirebaseFirestore.instance;
      db
          .collection(FirebaseConstants.users)
          .doc(userId)
          .collection(FirebaseConstants.tasks)
          .doc(oldTask.id)
          .set(newTask.copyWith(backup: true).toJson());

      return ResultHandler.success(data: newTask);
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<UserModel, Failure>> updateUserDetails(
      {String? newEmail, String? newPassword, String? newDisplayName}) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw FirebaseAuthException(code: 'no-user');
      }
      if (newEmail != null) {
        await user.verifyBeforeUpdateEmail(newEmail);
      }
      if (newPassword != null) {
        await user.updatePassword(newPassword);
      }
      if (newDisplayName != null) {
        await user.updateDisplayName(newDisplayName);
      }
      await user.reload();
      user = FirebaseAuth.instance.currentUser;
      UserModel userModel = UserModel(
        id: user!.uid,
        name: user.displayName!,
        email: user.email!,
        createdAt: user.metadata.creationTime!,
      );
      return ResultHandler.success(data: userModel);
    } on FirebaseAuthException catch (e) {
      return ResultHandler.failure(
        error: FirebaseFailure.fromCode(e.code),
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<bool, Failure>> uploadAllTasks(
      {required List<TaskModel> tasks}) {
    throw UnimplementedError();
  }

  @override
  Future<ResultHandler<bool, Failure>> sendNotification(
      NotificationModel notification) async {
    try {
      var db = FirebaseFirestore.instance;
      await db
          .collection(FirebaseConstants.completeNotifications)
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
          .collection(FirebaseConstants.completeNotifications)
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
      var query =
          db.collection(FirebaseConstants.completeNotifications).limit(limit);

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
