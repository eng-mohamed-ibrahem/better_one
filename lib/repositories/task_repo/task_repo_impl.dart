import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/data_source/task_data_source/task_source_interface.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/repositories/task_repo/task_repo_interface.dart';

class TaskRepoImpl implements TaskRepoInterface {
  TaskRepoImpl({required this.dataSource});
  final TaskSource dataSource;

  @override
  Future<ResultHandler<List<TaskModel>, Failure>> getAllTasks() async {
    return await dataSource.getAllTasks();
  }

  @override
  Future<ResultHandler<int, Failure>> getTotoalEstimatedTime() async {
    return await dataSource.getTotoalEstimatedTime();
  }
}
