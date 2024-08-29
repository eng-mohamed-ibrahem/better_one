part of 'setting_viewmode.dart';

@freezed
class SettingViewModelState with _$SettingViewModelState {
  const factory SettingViewModelState({
    @Default(true) bool isInitial,
    //* change language
    @Default(false) bool isChangeLanguageLoading,
    @Default(false) bool isChangeLanguageCompleted,
    @Default(false) bool isChangeLanguageFailed,
    //* get current language
    @Default(false) bool isGetLanguageLoading,
    @Default(false) bool isGetLanguageCompleted,
    @Default(false) bool isGetLanguageFailed,
    @Default(null) Locale? currentLanguage,
    //* search settings
    @Default(true) bool isSearchByTitle,
    @Default(false) bool isSearchByBody,
    @Default(false) bool isSearchByDate,
    @Default(false) bool isSearchByStatus,
    //* set search settings
    @Default(false) bool isSetSearchSettingsCompleted,
    @Default(false) bool isSetSearchSettingsFailed,
    //* get search settings
    @Default(false) bool isGetSearchSettingsCompleted,
    @Default(false) bool isGetSearchSettingsFailed,
    //* notification settings
    @Default(true) bool isNotificationOnAdd,
    @Default(false) bool isNotificationOnUpdate,
    @Default(false) bool isNotificationOnComplete,
    @Default(false) bool isNotificationOnReminder,
    @Default(null) DateTime? reminderDateTime,
    @Default(false) bool repeatReminder,
    @Default(false) bool isNotificationSettingsLoading,
    @Default(false) bool isNotificationSettingsCompleted,
    @Default(false) bool isNotificationSettingsFailed,
    //* error message
    @Default(null) String? errorMessage,
  }) = _SettingViewModelState;

  // /// intial
  // const factory SettingViewModelState.initial() = _initial;

  // /// get language
  // const factory SettingViewModelState.getLanguageLoading() =
  //     _GetLanguageLoading;
  // const factory SettingViewModelState.getLanguageCompleted(
  //     {required Locale? currentLanguage}) = _GetLanguageCompleted;

  // const factory SettingViewModelState.getLanguageFailed() = _GetLanguageFailed;

  // /// change language
  // const factory SettingViewModelState.changeLanguageLoading() =
  //     _ChangeLanguageLoading;

}
