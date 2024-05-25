import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/model/task_model/task_model.dart';

abstract class LocaleTaskInterface {
  /// get all tasks
  Future<ResultHandler<List<TaskModel>, Failure>> getAllTasks();

  /// get total estimated time
  Future<ResultHandler<int, Failure>> getTotoalEstimatedTime();
}
