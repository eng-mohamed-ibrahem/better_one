import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/core/utils/api_consumer/api_consumer.dart';
import 'package:better_one/data_source/task_data_source/task_source_interface.dart';
import 'package:better_one/model/task_model/task_model.dart';

class RemoteTaskDataSource implements TaskSource {
  RemoteTaskDataSource(this.apiConsumer);
  final ApiConsumer apiConsumer;

  @override
  Future<Result<TaskModel, Failure>> addTask(TaskModel newTask) {
    throw UnimplementedError();
  }

  @override
  Future<Result<TaskModel, Failure>> getTaskById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Result<List<TaskModel>, Failure>> getTasks() {
    throw UnimplementedError();
  }

  @override
  Future<Result<TaskModel, Failure>> removeTask(TaskModel removedTask) {
    throw UnimplementedError();
  }

  @override
  Future<Result<TaskModel, Failure>> updateTask(
      TaskModel oldTask, TaskModel newTask) {
    throw UnimplementedError();
  }

  @override
  Future<Result<int, Failure>> getTotoalEstimatedTime() {
    throw UnimplementedError();
  }

  @override
  Future<Result<int, Failure>> updateTotalEstimatedTime(
      int updatedTime, bool isAdding) {
    throw UnimplementedError();
  }
}
