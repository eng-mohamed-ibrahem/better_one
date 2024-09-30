import 'dart:io';

import 'package:better_one/core/constants/firebase_constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/data_source/user_data_source/remote_user_source.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/model/user_model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseRemoteUserSource implements RemoteUserSource {
  @override
  Future<ResultHandler<TaskModel, Failure>> addTask(TaskModel newTask) async {
    try {
      String? userId = inject<LocaleUserInfo>().getUserData()?.id;
      var db = FirebaseFirestore.instance;
      await db
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
      String? userId = inject<LocaleUserInfo>().getUserData()?.id;
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
        photoUrl: user.photoURL,
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
      String? userId = inject<LocaleUserInfo>().getUserData()?.id;
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
      String? userId = inject<LocaleUserInfo>().getUserData()?.id;
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
  Future<ResultHandler<UserModel, Failure>> updateUserDetails({
    String? newEmail,
    String? newPassword,
    String? newDisplayName,
    String? newPhotoPath,
  }) async {
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
      if (newPhotoPath != null) {
        FirebaseStorage storage = FirebaseStorage.instance;
        var profileRef = storage
            .ref('${FirebaseConstants.users}/${user.uid}')
            .child(FirebaseConstants.userPhoto);
        String? url;
        if (newPhotoPath.isEmpty) {
          await profileRef.delete();
          url = null;
        } else {
          await profileRef.putFile(File(newPhotoPath));
          url = await profileRef.getDownloadURL();
        }
        await user.updatePhotoURL(url);
      }
      await user.reload();
      user = FirebaseAuth.instance.currentUser;
      UserModel userModel = UserModel(
        id: user!.uid,
        name: user.displayName!,
        email: user.email!,
        photoUrl: user.photoURL,
        createdAt: user.metadata.creationTime!,
      );
      return ResultHandler.success(data: userModel);
    } on FirebaseAuthException catch (e) {
      return ResultHandler.failure(
        error: FirebaseFailure.fromCode(e.code),
      );
    } on FileSystemException catch (e) {
      return ResultHandler.failure(
        error: CacheFailure(message: e.message),
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }
}
