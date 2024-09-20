part of 'setting_viewmode.dart';

@freezed
class SettingViewmodelState with _$SettingViewmodelState {
  /// intial
  const factory SettingViewmodelState.initial() = _Initial;

  /// get language
  const factory SettingViewmodelState.getLanguageLoading() =
      _GetLanguageLoading;
  const factory SettingViewmodelState.getLanguageCompleted(
      {required Locale? currentLanguage}) = _GetLanguageCompleted;

  const factory SettingViewmodelState.getLanguageFailed(
      {required String message, required Failure failure}) = _GetLanguageFailed;

  /// change language
  const factory SettingViewmodelState.changeLanguageLoading() =
      _ChangeLanguageLoading;
  const factory SettingViewmodelState.changeLanguageCompleted(
      {required Locale? currentLanguage}) = _ChangeLanguageCompleted;

  const factory SettingViewmodelState.changeLanguageFailed(
      {required String message,
      required Failure failure}) = _ChangeLanguageFailed;

  /// set search settings
  const factory SettingViewmodelState.setSearchSettingsLoading() =
      _SetSearchSettingsLoading;

  const factory SettingViewmodelState.setSearchSettingsCompleted(
          {required SearchSettingModel newsearchSettings}) =
      _SetSearchSettingsCompleted;

  const factory SettingViewmodelState.setSearchByFailed({
    required String message,
    required Failure failure,
  }) = _SetSearchSettingsFailed;

  /// get search settings
  const factory SettingViewmodelState.getSearchSettingsLoading() =
      _GetSearchSettingsLoading;

  const factory SettingViewmodelState.getSearchSettingsCompleted() =
      _GetSearchSettingsCompleted;

  const factory SettingViewmodelState.getSearchSettingsFailed({
    required String message,
    required Failure failure,
  }) = _GetSearchSettingsFailed;

  /// notification settings
  const factory SettingViewmodelState.setNotificationSettingsLoading() =
      _SetNotificationSettingsLoading;

  const factory SettingViewmodelState.setNotificationSettingsCompleted(
          {required NotificationSettingModel newNotificationSettings}) =
      _SetNotificationSettingsCompleted;

  const factory SettingViewmodelState.setNotificationSettingsFailed({
    required String message,
    required Failure failure,
  }) = _SetNotificationSettingsFailed;

  /// get notification settings
  const factory SettingViewmodelState.getNotificationSettingsLoading() =
      _GetNotificationSettingsLoading;

  const factory SettingViewmodelState.getNotificationSettingsCompleted() =
      _GetNotificationSettingsCompleted;

  const factory SettingViewmodelState.getNotificationSettingsFailed({
    required String message,
    required Failure failure,
  }) = _GetNotificationSettingsFailed;

  /// set reminder event
  const factory SettingViewmodelState.setReminderEventLoading() =
      _SetReminderEventLoading;

  const factory SettingViewmodelState.setReminderEventCompleted() =
      _SetReminderEventCompleted;

  const factory SettingViewmodelState.setReminderEventFailed({
    required String message,
    required Failure failure,
  }) = _SetReminderEventFailed;

  /// create event
  const factory SettingViewmodelState.createEventLoading() =
      _CreateEventLoading;
  const factory SettingViewmodelState.createEventCompleted(
    {required EventCalendarModel event}
  ) =  
      _CreateEventCompleted;

  const factory SettingViewmodelState.createEventFailed({
    required String message,
    required Failure failure,
  }) = _CreateEventFailed;
}
