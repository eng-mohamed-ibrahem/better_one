import 'dart:convert';
import 'dart:isolate';

import 'package:better_one/core/constants/cache_keys.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/firebase_options.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class TasksBackgroundService {
  static final ReceivePort downloadReceiverPort = ReceivePort();
  static final ReceivePort uploadReceiverPort = ReceivePort();
  static late final Isolate downloadIsolate;
  static late final Isolate uploadIsolate;

  static void downloadTasks(RootIsolateToken? token) async {
    kDebugPrint('root isolate download task');
    downloadIsolate = await Isolate.spawn(
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
    kDebugPrint("3");

    var appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);
    var appBox = await Hive.openBox("user_data");
    kDebugPrint("5");

    try {
      kDebugPrint("start loading tasks");
      List<TaskModel> tasks = [];

      String? userId = appBox.get(CacheKeys.userId);
      var db = FirebaseFirestore.instance;
      var collection =
          await db.collection("users").doc(userId).collection("tasks").get();
      tasks = collection.docs.map(
        (element) {
          return TaskModel.fromJson(element.data());
        },
      ).toList();
      await appBox.put(
        CacheKeys.tasks,
        {
          for (var task in tasks) task.id: jsonEncode(task.toJson()),
        },
      );

      /// downloaded tasks
      await appBox.put(CacheKeys.downloadService, true);
      (args['send_port'] as SendPort).send(true);
      kDebugPrint(
          "complete loading tasks: ${appBox.get(CacheKeys.downloadService)}");
    } catch (e) {
      appBox.put(CacheKeys.downloadService, false);
      (args['send_port'] as SendPort).send(false);
      kDebugPrint("error loading tasks :${e.toString()}");
    }
  }

  static void uploadTasks(RootIsolateToken? token) async {
    uploadIsolate = await Isolate.spawn(
      _uploadEntryPoint,
      {
        "send_port": downloadReceiverPort.sendPort,
        "token": token,
      },
    );
  }

  static void _uploadEntryPoint(Map<String, dynamic> args) async {
    var hive = HiveInit();
    await hive.init();

    try {
      List<TaskModel> tasks = [];
      tasks = _convertToTaskList(
          (hive.appBox.get(CacheKeys.tasks) as Map?)?.values.toList());

      final userLocaleDatabase = HiveLocaleUserInfo(initHive: hive);
      String? userId = userLocaleDatabase.getUserIdFromLocale();
      var db = FirebaseFirestore.instance;
      var collectionRef =
          db.collection("users").doc(userId).collection("tasks");
      for (var task in tasks) {
        await collectionRef
            .doc(task.id)
            .set(task.copyWith(backup: true).toJson());
      }

      /// uploaded tasks
      hive.appBox.put(CacheKeys.uploadService, true);
    } catch (e) {
      hive.appBox.put(CacheKeys.uploadService, false);
    }
  }

  static List<TaskModel> _convertToTaskList(List<dynamic>? list) {
    return list == null
        ? []
        : list.map((e) => TaskModel.fromJson(jsonDecode(e))).toList();
  }
}
