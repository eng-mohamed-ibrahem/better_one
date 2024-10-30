part of 'notification_viewmodel.dart';

@freezed
class NotificationViewmodelState with _$NotificationViewmodelState {
  /// initial
  const factory NotificationViewmodelState.initial() = _Initial;

  /// send notification
  const factory NotificationViewmodelState.sendNotificationLoading() =
      _SendNotificationLoading;

  const factory NotificationViewmodelState.sendNotificationFailed({
    required Failure failure,
  }) = _SendNotificationFailed;

  const factory NotificationViewmodelState.sendNotificationSuccess() =
      _SendNotificationSuccess;

  /// get notification stream
  const factory NotificationViewmodelState.getNotificationStreamloading() =
      _GetNotificationStreamloading;

  const factory NotificationViewmodelState.getNotificationStreamFailed({
    required Failure failure,
  }) = _GetNotificationStreamFailed;

  const factory NotificationViewmodelState.getNotificationStreamSuccess({
    required Stream<List<NotificationModel>> stream,
  }) = _GetNotificationStreamSuccess;

  /// get notification
  const factory NotificationViewmodelState.getNotificationsLoading() =
      _GetNotificationsLoading;

  const factory NotificationViewmodelState.getNewNotificationsLoading() =
      _GetNewNotificationsLoading;

  const factory NotificationViewmodelState.getNotificationsFailed({
    required Failure failure,
  }) = _GetNotificationsFailed;

  const factory NotificationViewmodelState.getNewNotificationsFailed({
    required Failure failure,
  }) = _GetNewNotificationsFailed;

  const factory NotificationViewmodelState.getNotificationsSuccess({
    required List<NotificationModel> list,
  }) = _GetNotificationsSuccess;

  const factory NotificationViewmodelState.getTaskFromNotificationLoading() =
      _GetTaskFromNotificationLoading;

  const factory NotificationViewmodelState.getTaskFromNotificationSuccess({
    required TaskModel task,
  }) = _GetTaskFromNotificationSuccess;

  const factory NotificationViewmodelState.getTaskFromNotificationFailed({
    required Failure failure,
  }) = _GetTaskFromNotificationFailed;
}
