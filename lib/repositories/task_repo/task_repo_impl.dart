import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/data_source/task_data_source/task_source_interface.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/repositories/task_repo/task_repo_interface.dart';

class TaskRepoImpl implements TaskRepoInterface {
  TaskRepoImpl(this.dataSource);
  final TaskSource dataSource;

  @override
  Future<Result<TaskModel, Failure>> addTask(TaskModel task) async {
    return await dataSource.addTask(task);
  }

  @override
  Future<Result<TaskModel, Failure>> removeTask(TaskModel removedTask) async {
    return await dataSource.removeTask(removedTask);
  }

  @override
  Future<Result<TaskModel, Failure>> updateTask(
      TaskModel oldTask, TaskModel newTask) async {
    return await dataSource.updateTask(oldTask, newTask);
  }

  @override
  Future<Result<List<TaskModel>, Failure>> getTasks() async {
    return await dataSource.getTasks();
  }

  @override
  Future<Result<TaskModel?, Failure>> getTaskById(String id) async {
    return await dataSource.getTaskById(id);
  }

  @override
  Future<Result<int, Failure>> getTotoalEstimatedTime() async {
    return await dataSource.getTotoalEstimatedTime();
  }

  @override
  Future<Result<int, Failure>> updateTotalEstimatedTime(
      int updatedTime, bool isAdding) async {
    return await dataSource.updateTotalEstimatedTime(updatedTime, isAdding);
  }
}
