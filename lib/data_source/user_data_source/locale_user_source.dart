import 'package:better_one/core/enum/task_status.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/data_source/user_data_source/crud_task_mixin.dart';
import 'package:better_one/model/task_model/task_model.dart';

abstract class LocaleUserSource with CRUDTaskMixin {
  /// filter with status
  Future<ResultHandler<List<TaskModel>, Failure>> filterWithStatuses(
      Set<TaskStatus> statuses);

  /// search
  Future<ResultHandler<List<TaskModel>, Failure>> search(String query);
}
