import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/core/utils/cache_service/cache_interface.dart';
import 'package:better_one/data_source/task_data_source/task_source_interface.dart';
import 'package:better_one/model/task_model/task_model.dart';

class LocalTaskDataSource implements TaskSource {
  LocalTaskDataSource(this.cacheRepo);

  /// this method which i use to execute my local data source
  final CacheMethodInterface cacheRepo;

  @override
  Future<Result<TaskModel, Failure>> addTask(TaskModel newTask) async {
    try {
      return await cacheRepo.addTask(newTask);
    } catch (e) {
      return Result.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<List<TaskModel>, Failure>> getTasks() async {
    try {
      var result = await cacheRepo.getAllTasks();
      return result;
    } catch (e) {
      return Result.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<TaskModel, Failure>> removeTask(TaskModel removedTask) async {
    try {
      return await cacheRepo.removeTask(removedTask);
    } catch (e) {
      return Result.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<TaskModel, Failure>> updateTask(
      TaskModel oldTask, TaskModel newTask) async {
    try {
      return await cacheRepo.updateTask(oldTask, newTask);
    } catch (e) {
      return Result.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<TaskModel, Failure>> getTaskById(String id) async {
    try {
      return cacheRepo.getTaskById(id);
    } catch (e) {
      return Result.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<int, Failure>> getTotoalEstimatedTime() async {
    try {
      return await cacheRepo.getTotoalEstimatedTime();
    } catch (e) {
      return Result.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<int, Failure>> updateTotalEstimatedTime(
      int time, bool isAdding) async {
    try {
      return await cacheRepo.updateTotalEstimatedTime(time, isAdding);
    } catch (e) {
      return Result.failure(error: OtherFailure(message: e.toString()));
    }
  }
}
