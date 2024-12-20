import 'package:better_one/core/constants/firebase_constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/service/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/data_source/task_data_source/task_source_interface.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// this class fetch tasks from firebase once the user is logged in
///
/// and not using after that time.
class FirebaseTaskDataSource implements TaskSource {
  List<TaskModel>? tasks;

  @override
  Future<ResultHandler<List<TaskModel>, Failure>> getAllTasks() async {
    try {
      String? userId = inject<LocaleUserInfo>().getUserData()?.id;
      var db = FirebaseFirestore.instance;
      var collection = await db
          .collection(FirebaseConstants.users)
          .doc(userId)
          .collection(FirebaseConstants.tasks)
          .get();
      return ResultHandler.success(
        data: tasks = collection.docs.map(
          (element) {
            return TaskModel.fromJson(element.data());
          },
        ).toList(),
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<int, Failure>> getTotoalEstimatedTime() async {
    if (tasks == null) {
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
    } else {
      return ResultHandler.success(
        data: tasks!.fold(
          0,
          (previousValue, element) {
            return previousValue + element.elapsedTime.inMicroseconds;
          },
        ),
      );
    }
  }
}
