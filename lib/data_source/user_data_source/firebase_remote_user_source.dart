import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/data_source/user_data_source/remote_user_source.dart';
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
          .collection("users")
          .doc(userId)
          .collection("tasks")
          .doc(newTask.id)
          .set(newTask.toJson());
      return ResultHandler.success(data: newTask);
    } on FirebaseAuthException catch (e) {
      return ResultHandler.failure(
        error: FirebaseFailure(
          code: e.code,
          message: e.message!,
        ),
      );
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
          .collection("users")
          .doc(userId)
          .collection("tasks")
          .doc(id)
          .get();
      return ResultHandler.success(data: TaskModel.fromJson(doc.data()!));
    } on FirebaseAuthException catch (e) {
      return ResultHandler.failure(
        error: FirebaseFailure(
          code: e.code,
          message: e.message!,
        ),
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<UserModel?, Failure>> getUserDetails() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return const ResultHandler.success(data: null);
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
        error: FirebaseFailure(
          code: e.code,
          message: e.message!,
        ),
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
        error: FirebaseFailure(
          code: e.code,
          message: e.message!,
        ),
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
      db
          .collection("users")
          .doc(userId)
          .collection("tasks")
          .doc(removedTask.id)
          .delete();
      return ResultHandler.success(data: removedTask);
    } on FirebaseAuthException catch (e) {
      return ResultHandler.failure(
        error: FirebaseFailure(
          code: e.code,
          message: e.message!,
        ),
      );
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
          .collection("users")
          .doc(userId)
          .collection("tasks")
          .doc(oldTask.id)
          .update(newTask.toJson());

      return ResultHandler.success(data: newTask);
    } on FirebaseAuthException catch (e) {
      return ResultHandler.failure(
        error: FirebaseFailure(
          code: e.code,
          message: e.message!,
        ),
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<UserModel?, Failure>> updateUserDetails(
      {String? newEmail, String? newPassword, String? newDisplayName}) {
    throw UnimplementedError();
  }

  @override
  Future<ResultHandler<bool, Failure>> uploadAllTasks(
      {required List<TaskModel> tasks}) {
    throw UnimplementedError();
  }
}
