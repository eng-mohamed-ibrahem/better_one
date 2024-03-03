import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/model/task_model/task_model.dart';

abstract class CacheMethodInterface {
  /// init cache method
  Future<void> init();

  /// get all tasks
  Future<Result<List<TaskModel>, CacheFailure>> getAllTasks();

  /// get task by id
  Future<Result<TaskModel, CacheFailure>> getTaskById(String id);

  /// add new task
  Future<Result<TaskModel, CacheFailure>> addTask(TaskModel task);

  /// update task
  Future<Result<TaskModel, CacheFailure>> updateTask(
      TaskModel oldTask, TaskModel newTask);

  /// remove task
  Future<Result<TaskModel, CacheFailure>> removeTask(TaskModel removedTask);

  /// get total estimated time
  Future<Result<int, CacheFailure>> getTotoalEstimatedTime();

  /// update total estimated time
  Future<Result<int, CacheFailure>> updateTotalEstimatedTime(
      int updatedTime, bool isAdding);
}
