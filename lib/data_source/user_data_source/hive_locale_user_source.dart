import 'dart:convert';
import 'dart:io';

import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/data_source/user_data_source/locale_user_source.dart';
import 'package:better_one/model/task_model/task_model.dart';

class HiveLocaleUser implements LocaleUserSource {
  @override
  Future<ResultHandler<TaskModel, Failure>> addTask(TaskModel newTask) async {
    try {
      /// set tasks as key and values are tasks map
      // 1: get the tasks as map
      Map? tasks = inject<HiveInit>().appBox.get(CacheKeys.tasks);

      await inject<HiveInit>().appBox.put(CacheKeys.tasks, {
        ...?tasks,
        newTask.id: jsonEncode(newTask.toJson()),
      });
      // await inject<HiveInit>().appBox.put(
      //       CacheKeys.tasks,
      //       _convertToJson(
      //         _convertToTaskList(inject<HiveInit>().appBox.get(CacheKeys.tasks))
      //           ..add(newTask),
      //       ),
      //     );
      return ResultHandler.success(data: newTask);
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
  Future<ResultHandler<TaskModel, Failure>> getTaskById(String id) async {
    try {
      // var tasks =
      //     _convertToTaskList(inject<HiveInit>().appBox.get(CacheKeys.tasks));
      return ResultHandler.success(
        data: TaskModel.fromJson(jsonDecode(
            (inject<HiveInit>().appBox.get(CacheKeys.tasks) as Map)[id])),
      );
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
  Future<ResultHandler<TaskModel, Failure>> removeTask(
      TaskModel removedTask) async {
    try {
      var tasks = (inject<HiveInit>().appBox.get(CacheKeys.tasks) as Map);
      tasks.remove(removedTask.id);
      // var tasks =
      //     _convertToTaskList(inject<HiveInit>().appBox.get(CacheKeys.tasks));
      // tasks.remove(removedTask);
      await inject<HiveInit>().appBox.put(CacheKeys.tasks, {...tasks});
      return ResultHandler.success(data: removedTask);
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
  Future<ResultHandler<TaskModel, Failure>> updateTask(
      TaskModel oldTask, TaskModel newTask) async {
    try {
      var tasks = (inject<HiveInit>().appBox.get(CacheKeys.tasks) as Map);
      // var tasks =
      //     _convertToTaskList(inject<HiveInit>().appBox.get(CacheKeys.tasks));
      // int index = tasks.indexWhere((element) => element.id == oldTask.id);
      // tasks[index] = newTask;

      tasks[oldTask.id] = jsonEncode(newTask.toJson());
      await inject<HiveInit>().appBox.put(CacheKeys.tasks, {...tasks});
      return ResultHandler.success(data: newTask);
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

  // List<String> _convertToJson(List<TaskModel> list) {
  //   return list.map((e) => jsonEncode(e.toJson())).toList();
  // }

  // List<TaskModel> _convertToTaskList(List<dynamic>? list) {
  //   return list == null
  //       ? []
  //       : list.map((e) => TaskModel.fromJson(jsonDecode(e))).toList();
  // }
}
