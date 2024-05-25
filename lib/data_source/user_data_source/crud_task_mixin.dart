import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/model/task_model/task_model.dart';

mixin CRUDTaskMixin {
  Future<ResultHandler<TaskModel, Failure>> addTask(TaskModel newTask);
  Future<ResultHandler<TaskModel, Failure>> removeTask(TaskModel removedTask);
  Future<ResultHandler<TaskModel, Failure>> updateTask(
      TaskModel oldTask, TaskModel newTask);
  Future<ResultHandler<TaskModel, Failure>> getTaskById(String id);
}
