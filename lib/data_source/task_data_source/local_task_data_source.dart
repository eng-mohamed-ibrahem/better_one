import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';
import 'package:better_one/data_source/task_data_source/task_source_interface.dart';
import 'package:better_one/model/task_model/task_model.dart';

class LocalTaskDataSource implements TaskSource {
  LocalTaskDataSource({required this.cache});

  /// this method which i use to execute my local data source
  final LocaleTaskInterface cache;

  @override
  Future<ResultHandler<List<TaskModel>, Failure>> getAllTasks() async {
    var result = await cache.getAllTasks();
    return result;
  }

  @override
  Future<ResultHandler<int, Failure>> getTotoalEstimatedTime() async {
    return await cache.getTotoalEstimatedTime();
  }
}
