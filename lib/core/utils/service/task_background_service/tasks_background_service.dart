import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

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
  static final ReceivePort downloadReceiverPort = ReceivePort()
    ..asBroadcastStream();
  static final ReceivePort uploadReceiverPort = ReceivePort()
    ..asBroadcastStream();
  static final StreamController _streamController =
      StreamController.broadcast();
  static Stream get serviceStream => _streamController.stream;
  static void downloadTasks(RootIsolateToken? token) async {
    kDebugPrint('root isolate, download task');
    await Isolate.spawn(
      _downloadEntryPoint,
      {
        "send_port": downloadReceiverPort.sendPort,
        "token": token,
      },
    );
  }

  static void _downloadEntryPoint(Map<String, dynamic> args) async {
    await _initialize(args);
    var appCache = await Hive.openBox(CacheKeys.userData);
    kDebugPrint("hive init");

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
          .orderBy("created_at", descending: true)
          .get();
      downloadedTasks = collection.docs.map(
        (element) {
          return TaskModel.fromJson(element.data());
        },
      ).toList();
      var localeTasks = appCache.get(CacheKeys.tasks) as Map?;
      localeTasks != null
          ? () {
              /// merge downloaded tasks with locale tasks
              for (var index = 0; index < localeTasks.values.length; index++) {
                for (var downloadedtask in downloadedTasks) {
                  if (localeTasks.containsKey(downloadedtask.id)) {
                    Set<SubTask> subtasks = Set<SubTask>.from(
                      downloadedtask.subTasks,
                    );
                    subtasks.addAll(
                        TaskModel.fromString(localeTasks[downloadedtask.id])
                            .subTasks);
                    localeTasks[downloadedtask.id] = downloadedtask
                        .copyWith(subTasks: subtasks.toList())
                        .asString();
                    downloadedTasks.remove(downloadedtask);
                    break;
                  }
                }
              }
            }()
          : null;
      await appCache.put(
        CacheKeys.tasks,
        {
          ...?localeTasks,
          for (var task in downloadedTasks) task.id: task.asString(),
        },
      );
      await appCache.put(CacheKeys.downloadService, true);
      kDebugPrint("end loading tasks: true");

      (args['send_port'] as SendPort).send(true);
    } catch (e) {
      await appCache.put(CacheKeys.downloadService, false);
      kDebugPrint("end loading tasks: error ${e.toString()}");
      (args['send_port'] as SendPort).send(false);
      rethrow;
    }
  }

  static Future<void> _initialize(Map<String, dynamic> args) async {
    DartPluginRegistrant.ensureInitialized();
    kDebugPrint("begin download task");
    BackgroundIsolateBinaryMessenger.ensureInitialized(
        (args['token'] as RootIsolateToken));

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    kDebugPrint("firebase init");

    var appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);
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
    await _initialize(args);
    var appCache = await Hive.openBox(CacheKeys.userData);
    kDebugPrint("hive init");
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
    downloadReceiverPort.listen((event) {
      _streamController.add(event);
      uploadTasks(token);
    });
  }

  static List<TaskModel> _convertToTaskList(List<dynamic>? list) {
    return list == null
        ? []
        : list.map((e) => TaskModel.fromString(e)).toList();
  }
}
