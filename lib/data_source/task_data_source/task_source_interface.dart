import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/model/task_model/task_model.dart';

abstract class TaskSource {
  Future<Result<TaskModel, Failure>> addTask(TaskModel newTask);
  Future<Result<TaskModel, Failure>> removeTask(TaskModel removedTask);
  Future<Result<TaskModel, Failure>> updateTask(
      TaskModel oldTask, TaskModel newTask);
  Future<Result<List<TaskModel>, Failure>> getTasks();
  Future<Result<TaskModel, Failure>> getTaskById(String id);
  Future<Result<int, Failure>> getTotoalEstimatedTime();
  Future<Result<int, Failure>> updateTotalEstimatedTime(
      int updatedTime, bool isAdding);
}
