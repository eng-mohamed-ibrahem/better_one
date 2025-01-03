import 'dart:io';

import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/service/cache_service/cache_service.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/data_source/task_data_source/task_source_interface.dart';
import 'package:better_one/model/task_model/task_model.dart';

class HiveLocaleTask implements TaskSource {
  @override
  Future<ResultHandler<List<TaskModel>, Failure>> getAllTasks() async {
    try {
      return ResultHandler.success(
          data: _convertToTaskList(
              (inject<HiveCache>().appCache.get(CacheKeys.tasks) as Map?)
                  ?.values
                  .toList()));
    } on FileSystemException catch (e) {
      return ResultHandler.failure(
        error: CacheFailure(message: e.message),
      );
    } on FormatException catch (e) {
      return ResultHandler.failure(
        error: ParserFailure(message: e.message),
      );
    } catch (e) {
      return ResultHandler.failure(
        error: OtherFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<ResultHandler<int, Failure>> getTotoalEstimatedTime() async {
    var result = await getAllTasks();
    return result.when(
      success: (tasks) {
        return ResultHandler.success(
          data: tasks.fold(
            0,
            (previousValue, element) {
              return previousValue + element.elapsedTime.inMicroseconds;
            },
          ),
        );
      },
      failure: (failure) {
        return ResultHandler.failure(error: failure);
      },
    );
  }

  List<TaskModel> _convertToTaskList(List<dynamic>? list) {
    return list == null
        ? []
        : list.map((e) => TaskModel.fromString(e)).toList();
  }
}
