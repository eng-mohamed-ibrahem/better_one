import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/repositories/notification_repo/notification_repo_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_viewmodel.freezed.dart';
part 'notification_viewmodel_state.dart';

class NotificationViewmodel extends Cubit<NotificationViewmodelState> {
  NotificationViewmodel({required NotificationRepoInterface notificationRepo})
      : _notificationRepo = notificationRepo,
        super(const NotificationViewmodelState.initial());
  final NotificationRepoInterface _notificationRepo;
  late final Stream<List<NotificationModel>> tasksStream;
  final List<NotificationModel> list = [];
  late TaskModel? sharedTask;

  void sendNotification(NotificationModel notification) async {
    emit(const _SendNotificationLoading());
    var result = await _notificationRepo.sendNotification(notification);
    result.when(
      success: (_) => emit(const _SendNotificationSuccess()),
      failure: (failure) => emit(
        _SendNotificationFailed(
          failure: failure,
        ),
      ),
    );
  }

  void getNotificationStream() async {
    emit(const _GetNotificationStreamloading());
    var result = await _notificationRepo.listenNotifications();
    result.when(
      success: (stream) {
        tasksStream = stream;
        emit(
          _GetNotificationStreamSuccess(stream: stream),
        );
      },
      failure: (failure) => emit(
        _GetNotificationStreamFailed(
          failure: failure,
        ),
      ),
    );
  }

  void getNotifications({bool loadMore = false}) async {
    if (state is _GetNewNotificationsLoading) {
      return;
    }
    emit(
      loadMore
          ? const _GetNewNotificationsLoading()
          : const _GetNotificationsLoading(),
    );
    var result =
        await _notificationRepo.getNotifications(10, loadMore: loadMore);
    result.when(
      success: (notifications) {
        list.addAll(notifications);
        emit(
          _GetNotificationsSuccess(list: notifications),
        );
      },
      failure: (failure) => emit(
        loadMore
            ? _GetNewNotificationsFailed(
                failure: failure,
              )
            : _GetNotificationsFailed(
                failure: failure,
              ),
      ),
    );
  }

  void getTaskFromNotification({
    required String taskId,
    required String senderId,
  }) async {
    emit(const _GetTaskFromNotificationLoading());
    var result = await _notificationRepo.getTaskFromNotification(
      taskId: taskId,
      senderId: senderId,
    );
    result.when(
      success: (task) {
        sharedTask = task;
        emit(
          _GetTaskFromNotificationSuccess(task: task),
        );
      },
      failure: (failure) => emit(
        _GetTaskFromNotificationFailed(
          failure: failure,
        ),
      ),
    );
  }
}
