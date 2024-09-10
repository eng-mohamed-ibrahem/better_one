import 'dart:convert';
import 'dart:io';

import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';
import 'package:better_one/model/task_model/task_model.dart';

class HiveLocaleTask implements LocaleTaskInterface {
  HiveLocaleTask({required this.initHive});
  final HiveInit initHive;
  @override
  Future<ResultHandler<List<TaskModel>, Failure>> getAllTasks() async {
    try {
      return ResultHandler.success(
          data: _convertToTaskList(
              (initHive.appBox.get(CacheKeys.tasks) as Map?)?.values.toList()));
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
        : list.map((e) => TaskModel.fromJson(jsonDecode(e))).toList();
  }
}
