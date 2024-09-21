import 'dart:isolate';

import 'package:better_one/core/constants/cache_keys.dart';
import 'package:better_one/core/constants/firebase_constants.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/firebase_options.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/model/user_model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class TasksBackgroundService {
  static final ReceivePort downloadReceiverPort = ReceivePort();
  static final ReceivePort uploadReceiverPort = ReceivePort();

  static void downloadTasks(RootIsolateToken? token) async {
    kDebugPrint('root isolate download task');
    await Isolate.spawn(
      _downloadEntryPoint,
      {
        "send_port": downloadReceiverPort.sendPort,
        "token": token,
      },
    );
  }

  static void _downloadEntryPoint(Map<String, dynamic> args) async {
    kDebugPrint("1");
    BackgroundIsolateBinaryMessenger.ensureInitialized(
        (args['token'] as RootIsolateToken));

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    kDebugPrint("2");

    var appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);
    var appCache = await Hive.openBox(CacheKeys.userData);
    kDebugPrint("3");

    try {
      kDebugPrint("start loading tasks");
      List<TaskModel> downloadedTasks = [];

      var user =
          UserModel.fromString(appCache.get(CacheKeys.userData) as String);
      var db = FirebaseFirestore.instance;
      var collection = await db
          .collection(FirebaseConstants.users)
          .doc(user.id)
          .collection(FirebaseConstants.tasks)
          .get();
      downloadedTasks = collection.docs.map(
        (element) {
          return TaskModel.fromJson(element.data());
        },
      ).toList();
      var localeTasks = appCache.get(CacheKeys.tasks) as Map?;
      await appCache.put(
        CacheKeys.tasks,
        {
          ...?localeTasks,
          for (var task in downloadedTasks) task.id: task.asString(),
        },
      );
      await appCache.put(CacheKeys.downloadService, true);
      kDebugPrint("end loading tasks: true");
      downloadReceiverPort.sendPort.send(true);

      /// upload tasks
      uploadTasks(args['token']);
    } catch (e) {
      await appCache.put(CacheKeys.downloadService, false);
      kDebugPrint("end loading tasks: error ${e.toString()}");
      downloadReceiverPort.sendPort.send(false);
    }
  }

  static void uploadTasks(RootIsolateToken? token) async {
    Isolate.spawn(
      _uploadEntryPoint,
      {
        "send_port": uploadReceiverPort.sendPort,
        "token": token,
      },
    );
  }

  static void _uploadEntryPoint(Map<String, dynamic> args) async {
    kDebugPrint("1");
    BackgroundIsolateBinaryMessenger.ensureInitialized(
        (args['token'] as RootIsolateToken));

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    kDebugPrint("2");

    var appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);
    var appCache = await Hive.openBox(CacheKeys.userData);
    kDebugPrint("3");
    try {
      List<TaskModel> uploadedTasks = [];
      uploadedTasks = _convertToTaskList(
          (appCache.get(CacheKeys.tasks) as Map?)?.values.toList());
      var user =
          UserModel.fromString(appCache.get(CacheKeys.userData) as String);
      var db = FirebaseFirestore.instance;
      var collectionRef = db
          .collection(FirebaseConstants.users)
          .doc(user.id)
          .collection(FirebaseConstants.tasks);
      for (var task in uploadedTasks) {
        await collectionRef
            .doc(task.id)
            .set(task.copyWith(backup: true).toJson());
      }

      /// uploaded tasks
      await appCache.put(CacheKeys.uploadService, true);
      (args['send_port'] as SendPort).send(true);
      kDebugPrint("complete uploading tasks");
    } catch (e) {
      await appCache.put(CacheKeys.uploadService, false);
      (args['send_port'] as SendPort).send(false);
      kDebugPrint("error uploading tasks :${e.toString()}");
    }
  }

  static void syncTasks(RootIsolateToken? token) {
    downloadTasks(token);
  }

  static List<TaskModel> _convertToTaskList(List<dynamic>? list) {
    return list == null ? [] : list.map((e) => TaskModel.fromString(e)).toList();
  }
}
