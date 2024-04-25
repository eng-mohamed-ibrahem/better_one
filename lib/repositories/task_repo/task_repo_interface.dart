import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/model/task_model/task_model.dart';

abstract class TaskRepoInterface {
  /// to get all user tasks
  Future<ResultHandler<List<TaskModel>, Failure>> getTasks();

  ///get task by id
  Future<ResultHandler<TaskModel?, Failure>> getTaskById(String id);

  /// to add new task
  Future<ResultHandler<TaskModel, Failure>> addTask(TaskModel task);

  /// update task
  Future<ResultHandler<TaskModel, Failure>> updateTask(
      TaskModel oldTask, TaskModel newTask);

  /// remove task
  Future<ResultHandler<TaskModel, Failure>> removeTask(TaskModel removedTask);

  /// get total estimated time
  Future<ResultHandler<int, Failure>> getTotoalEstimatedTime();

  /// update total estimated time
  Future<ResultHandler<int, Failure>> updateTotalEstimatedTime(
      int updatedTime, bool isAdding);
}
