import 'dart:io';

import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/enum/task_status.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/service/cache_service/cache_service.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/data_source/user_data_source/locale_user_source.dart';
import 'package:better_one/model/event_calendar_model/event_calendar_model.dart';
import 'package:better_one/model/task_model/task_model.dart';

class HiveLocaleUser implements LocaleUserSource {
  @override
  Future<ResultHandler<TaskModel, Failure>> addTask(TaskModel newTask) async {
    try {
      /// set tasks as key and values are tasks map
      // 1: get the tasks as map
      Map? tasks = inject<HiveCache>().appCache.get(CacheKeys.tasks);
      await inject<HiveCache>().appCache.put(
        CacheKeys.tasks,
        {
          ...?tasks,
          newTask.id: newTask.asString(),
        },
      );
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
      return ResultHandler.success(
        data: TaskModel.fromString(
          (inject<HiveCache>().appCache.get(CacheKeys.tasks) as Map)[id],
        ),
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
      var tasks = (inject<HiveCache>().appCache.get(CacheKeys.tasks) as Map);
      tasks.remove(removedTask.id);
      await inject<HiveCache>().appCache.put(CacheKeys.tasks, tasks);
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
      var tasks = (inject<HiveCache>().appCache.get(CacheKeys.tasks) as Map);

      tasks[oldTask.id] = newTask.asString();
      await inject<HiveCache>().appCache.put(CacheKeys.tasks, tasks);
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
  Future<ResultHandler<List<TaskModel>, Failure>> filterWithStatuses(
      Set<TaskStatus> statuses) async {
    try {
      var tasks = inject<HiveCache>().appCache.get(CacheKeys.tasks) as Map?;
      var filteredTasks = <TaskModel>[];
      if (tasks != null) {
        var tasksAsList = _convertToTaskList(tasks.values.toList());
        for (var status in statuses) {
          tasksAsList.retainWhere(
            (task) {
              task.status == status ? filteredTasks.add(task) : null;
              return task.status != status;
            },
          );
        }
      }
      return ResultHandler.success(
        data: filteredTasks,
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
  Future<ResultHandler<List<TaskModel>, Failure>> search(String query) async {
    try {
      var tasks = inject<HiveCache>().appCache.get(CacheKeys.tasks) as Map?;
      var searchResult = <TaskModel>{};
      if (tasks != null) {
        var settingsResult = await settingRepo.getSearchSettings();
        settingsResult.when(
          success: (settings) {
            var tasksAsList = _convertToTaskList(tasks.values.toList());
            for (var task in tasksAsList) {
              if (settings.searchByTitle) {
                if (task.title.contains(query)) {
                  searchResult.add(task);
                }
              }
              if (settings.searchByBody) {
                for (var element in task.subTasks) {
                  if (element.title.contains(query)) {
                    searchResult.add(task);
                  }
                }
              }
            }
          },
          failure: (failure) {
            return ResultHandler.failure(error: failure);
          },
        );
      }
      return ResultHandler.success(
        data: searchResult.toList(),
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

  List<TaskModel> _convertToTaskList(List<dynamic>? list) {
    return list == null
        ? []
        : list.map((e) => TaskModel.fromString(e)).toList();
  }

  @override
  Future<ResultHandler<void, Failure>> createEvent(
      EventCalendarModel event) async {
    try {
      await Add2Calendar.addEvent2Cal(
        Event(
          title: event.title,
          description: event.description,
          startDate: event.startDate,
          endDate: event.endDate,
        ),
      );
      return const ResultHandler.success(data: null);
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }
}
