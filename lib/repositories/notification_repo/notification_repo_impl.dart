import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/service/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/core/utils/network_connection/network_connection.dart';
import 'package:better_one/data_source/notification_data_source/notification_source_interface.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/repositories/notification_repo/notification_repo_interface.dart';
import 'package:easy_localization/easy_localization.dart';

class NotificationRepoImpl implements NotificationRepoInterface {
  NotificationRepoImpl(
      {required NotificationSourceInterface notificationSource})
      : _notificationSource = notificationSource;
  final NotificationSourceInterface _notificationSource;
  @override
  Future<ResultHandler<bool, Failure>> sendNotification(
      NotificationModel notification) async {
    if (inject<LocaleUserInfo>().getUserData() == null) {
      return ResultHandler.failure(
          error: NoUserLogedInFailure(message: 'notification.login_req'.tr()));
    }
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return await _notificationSource.sendNotification(notification);
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<ResultHandler<Stream<List<NotificationModel>>, Failure>>
      listenNotifications() async {
    if (inject<LocaleUserInfo>().getUserData() == null) {
      return ResultHandler.failure(
          error: NoUserLogedInFailure(message: 'notification.login_req'.tr()));
    }
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return await _notificationSource.listenNotifications();
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<ResultHandler<List<NotificationModel>, Failure>> getNotifications(
      int limit,
      {bool loadMore = false}) async {
    if (inject<LocaleUserInfo>().getUserData() == null) {
      return ResultHandler.failure(
          error: NoUserLogedInFailure(message: 'notification.login_req'.tr()));
    }
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return await _notificationSource.getNotifications(limit,
          loadMore: loadMore);
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<ResultHandler<TaskModel, Failure>> getTaskFromNotification(
      {required String taskId, required String senderId}) async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return await _notificationSource.getTaskFromNotification(
          taskId: taskId, senderId: senderId);
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }
}
