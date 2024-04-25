import 'dart:convert';

import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:logger/logger.dart';

class TaskCacheByHive implements TaskCacheInterface {
  TaskCacheByHive({required this.cacheInit});
  final HiveInitImpl cacheInit;
  @override
  Future<ResultHandler<TaskModel, CacheFailure>> addTask(TaskModel task) async {
    try {
      var result = await getAllTasks();
      return result.when(
        success: (tasks) async {
          tasks.add(task);
          await cacheInit.appBox.put(CacheKeys.tasks, _convertToJson(tasks));
          return ResultHandler.success(data: task);
        },
        failure: (failure) {
          return ResultHandler.failure(error: failure);
        },
      );
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<List<TaskModel>, CacheFailure>> getAllTasks() async {
    try {
      return ResultHandler.success(
          data: _convertToTaskList(cacheInit.appBox.get(CacheKeys.tasks)));
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<TaskModel, CacheFailure>> getTaskById(String id) async {
    try {
      var result = await getAllTasks();
      return result.when(
        success: (tasks) {
          return ResultHandler.success(
            data: tasks.firstWhere(
              (taskModel) => taskModel.id == id,
            ),
          );
        },
        failure: (error) {
          return ResultHandler.failure(error: error);
        },
      );
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<TaskModel, CacheFailure>> removeTask(
      TaskModel removedTask) async {
    try {
      var result = await getAllTasks();
      return result.when(
        success: (tasks) async {
          tasks.remove(removedTask);
          await cacheInit.appBox.put(CacheKeys.tasks, _convertToJson(tasks));
          return ResultHandler.success(data: removedTask);
        },
        failure: (failure) {
          return ResultHandler.failure(error: failure);
        },
      );
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<TaskModel, CacheFailure>> updateTask(
      TaskModel oldTask, TaskModel newTask) async {
    try {
      var result = await getAllTasks();
      return result.when(
        success: (tasks) async {
          int index = tasks.indexOf(oldTask);
          Logger().i('from hive index $index');
          tasks[index] = newTask;
          await cacheInit.appBox.put(CacheKeys.tasks, _convertToJson(tasks));
          return ResultHandler.success(data: newTask);
        },
        failure: (failure) {
          return ResultHandler.failure(error: failure);
        },
      );
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }

  List<TaskModel> _convertToTaskList(List<dynamic>? list) {
    return list == null
        ? []
        : list.map((e) => TaskModel.fromJson(jsonDecode(e))).toList();
  }

  List<String> _convertToJson(List<TaskModel> list) {
    return list.map((e) => jsonEncode(e.toJson())).toList();
  }

  @override
  Future<ResultHandler<int, CacheFailure>> getTotoalEstimatedTime() async {
    try {
      return ResultHandler.success(
          data: cacheInit.appBox
              .get(CacheKeys.totalEstimatedTime, defaultValue: 0));
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<int, CacheFailure>> updateTotalEstimatedTime(
      int updatedTime, bool isAdding) async {
    try {
      var result = await getTotoalEstimatedTime();
      return result.when(
        success: (totalTime) async {
          totalTime =
              isAdding ? totalTime + updatedTime : totalTime - updatedTime;
          return ResultHandler.success(
              data: await cacheInit.appBox
                  .put(CacheKeys.totalEstimatedTime, totalTime)
                  .then((_) => totalTime));
        },
        failure: (failure) {
          return ResultHandler.failure(error: failure);
        },
      );
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }
}
