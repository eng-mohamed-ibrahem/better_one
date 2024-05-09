import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/remote_service/api_consumer/api_consumer.dart';
import 'package:better_one/data_source/task_data_source/task_source_interface.dart';
import 'package:better_one/model/task_model/task_model.dart';

class RemoteTaskDataSource implements TaskSource {
  RemoteTaskDataSource(this.apiConsumer);
  final ApiConsumer apiConsumer;

  @override
  Future<ResultHandler<TaskModel, Failure>> addTask(TaskModel newTask) {
    throw UnimplementedError();
  }

  @override
  Future<ResultHandler<TaskModel, Failure>> getTaskById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<ResultHandler<List<TaskModel>, Failure>> getTasks() {
    throw UnimplementedError();
  }

  @override
  Future<ResultHandler<TaskModel, Failure>> removeTask(TaskModel removedTask) {
    throw UnimplementedError();
  }

  @override
  Future<ResultHandler<TaskModel, Failure>> updateTask(
      TaskModel oldTask, TaskModel newTask) {
    throw UnimplementedError();
  }

  @override
  Future<ResultHandler<int, Failure>> getTotoalEstimatedTime() {
    throw UnimplementedError();
  }

  @override
  Future<ResultHandler<int, Failure>> updateTotalEstimatedTime(
      int updatedTime, bool isAdding) {
    throw UnimplementedError();
  }
}
