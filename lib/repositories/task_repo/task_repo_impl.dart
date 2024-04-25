import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/data_source/task_data_source/task_source_interface.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/repositories/task_repo/task_repo_interface.dart';

class TaskRepoImpl implements TaskRepoInterface {
  TaskRepoImpl({required this.dataSource});
  final TaskSource dataSource;

  @override
  Future<ResultHandler<TaskModel, Failure>> addTask(TaskModel task) async {
    return await dataSource.addTask(task);
  }

  @override
  Future<ResultHandler<TaskModel, Failure>> removeTask(
      TaskModel removedTask) async {
    return await dataSource.removeTask(removedTask);
  }

  @override
  Future<ResultHandler<TaskModel, Failure>> updateTask(
      TaskModel oldTask, TaskModel newTask) async {
    return await dataSource.updateTask(oldTask, newTask);
  }

  @override
  Future<ResultHandler<List<TaskModel>, Failure>> getTasks() async {
    return await dataSource.getTasks();
  }

  @override
  Future<ResultHandler<TaskModel?, Failure>> getTaskById(String id) async {
    return await dataSource.getTaskById(id);
  }

  @override
  Future<ResultHandler<int, Failure>> getTotoalEstimatedTime() async {
    return await dataSource.getTotoalEstimatedTime();
  }

  @override
  Future<ResultHandler<int, Failure>> updateTotalEstimatedTime(
      int updatedTime, bool isAdding) async {
    return await dataSource.updateTotalEstimatedTime(updatedTime, isAdding);
  }
}
