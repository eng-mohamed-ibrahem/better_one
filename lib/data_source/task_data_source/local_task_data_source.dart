import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';
import 'package:better_one/data_source/task_data_source/task_source_interface.dart';
import 'package:better_one/model/task_model/task_model.dart';

class LocalTaskDataSource implements TaskSource {
  LocalTaskDataSource({required this.cache});

  /// this method which i use to execute my local data source
  final TaskCacheInterface cache;

  @override
  Future<ResultHandler<TaskModel, Failure>> addTask(TaskModel newTask) async {
    try {
      return await cache.addTask(newTask);
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<List<TaskModel>, Failure>> getTasks() async {
    try {
      var result = await cache.getAllTasks();
      return result;
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<TaskModel, Failure>> removeTask(
      TaskModel removedTask) async {
    try {
      return await cache.removeTask(removedTask);
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<TaskModel, Failure>> updateTask(
      TaskModel oldTask, TaskModel newTask) async {
    try {
      return await cache.updateTask(oldTask, newTask);
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<TaskModel, Failure>> getTaskById(String id) async {
    try {
      return cache.getTaskById(id);
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<int, Failure>> getTotoalEstimatedTime() async {
    try {
      return await cache.getTotoalEstimatedTime();
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<int, Failure>> updateTotalEstimatedTime(
      int time, bool isAdding) async {
    try {
      return await cache.updateTotalEstimatedTime(time, isAdding);
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }
}
