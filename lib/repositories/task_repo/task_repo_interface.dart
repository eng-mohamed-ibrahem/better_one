import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/model/task_model/task_model.dart';

abstract class TaskRepoInterface {
  /// to get all user tasks
  Future<Result<List<TaskModel>, Failure>> getTasks();

  ///get task by id
  Future<Result<TaskModel?, Failure>> getTaskById(String id);

  /// to add new task
  Future<Result<TaskModel, Failure>> addTask(TaskModel task);

  /// update task
  Future<Result<TaskModel, Failure>> updateTask(
      TaskModel oldTask, TaskModel newTask);

  /// remove task
  Future<Result<TaskModel, Failure>> removeTask(TaskModel removedTask);

  /// get total estimated time
  Future<Result<int, Failure>> getTotoalEstimatedTime();

  /// update total estimated time
  Future<Result<int, Failure>> updateTotalEstimatedTime(
      int updatedTime, bool isAdding);
}
