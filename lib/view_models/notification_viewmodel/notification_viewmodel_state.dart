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
}
