import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/model/task_model/task_model.dart';

abstract class TaskCacheInterface {
  /// get all tasks
  Future<ResultHandler<List<TaskModel>, CacheFailure>> getAllTasks();

  /// get task by id
  Future<ResultHandler<TaskModel, CacheFailure>> getTaskById(String id);

  /// add new task
  Future<ResultHandler<TaskModel, CacheFailure>> addTask(TaskModel task);

  /// update task
  Future<ResultHandler<TaskModel, CacheFailure>> updateTask(
      TaskModel oldTask, TaskModel newTask);

  /// remove task
  Future<ResultHandler<TaskModel, CacheFailure>> removeTask(
      TaskModel removedTask);

  /// get total estimated time
  Future<ResultHandler<int, CacheFailure>> getTotoalEstimatedTime();

  /// update total estimated time
  Future<ResultHandler<int, CacheFailure>> updateTotalEstimatedTime(
      int updatedTime, bool isAdding);
}
