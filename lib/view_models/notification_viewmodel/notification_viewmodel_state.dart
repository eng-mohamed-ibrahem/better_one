part of 'notification_viewmodel.dart';

@freezed
class NotificationViewmodelState with _$NotificationViewmodelState {
  /// initial
  const factory NotificationViewmodelState.initial() = _Initial;

  /// send notification
  const factory NotificationViewmodelState.sendNotificationloading() =
      _SendNotificationloading;

  const factory NotificationViewmodelState.sendNotificationFailed({
    required Failure failure,
    required String message,
  }) = _SendNotificationFailed;

  const factory NotificationViewmodelState.sendNotificationSuccess() =
      _SendNotificationSuccess;

  /// get notification stream
  const factory NotificationViewmodelState.getNotificationStreamloading() =
      _GetNotificationStreamloading;

  const factory NotificationViewmodelState.getNotificationStreamFailed({
    required Failure failure,
    required String message,
  }) = _GetNotificationStreamFailed;

  const factory NotificationViewmodelState.getNotificationStreamSuccess({
    required Stream<List<NotificationModel>> stream,
  }) = _GetNotificationStreamSuccess;

  /// get notification
  const factory NotificationViewmodelState.getNotificationloading() =
      _GetNotificationloading;

  const factory NotificationViewmodelState.getNewNotificationloading() =
      _GetNewNotificationloading;

  const factory NotificationViewmodelState.getNotificationFailed({
    required Failure failure,
    required String message,
  }) = _GetNotificationFailed;

  const factory NotificationViewmodelState.getNewNotificationFailed({
    required String message,
  }) = _GetNewNotificationFailed;

  const factory NotificationViewmodelState.getNotificationSuccess({
    required List<QueryDocumentSnapshot<Object?>> list,
  }) = _GetNotificationSuccess;

  const factory NotificationViewmodelState.getTaskFromNotificationLoading() =
      _GetTaskFromNotificationLoading;

  const factory NotificationViewmodelState.getTaskFromNotificationSuccess({
    required TaskModel task,
  }) = _GetTaskFromNotificationSuccess;

  const factory NotificationViewmodelState.getTaskFromNotificationFailed({
    required Failure failure,
  }) = _GetTaskFromNotificationFailed;
}
