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
    @Default(false) bool isSetSearchSettingsLoading,
    @Default(false) bool isSetSearchSettingsCompleted,
    @Default(false) bool isSetSearchSettingsFailed,
    //* get search settings
    @Default(false) bool isGetSearchSettingsLoading,
    @Default(false) bool isGetSearchSettingsCompleted,
    @Default(false) bool isGetSearchSettingsFailed,
    //* error message
    @Default(null) String? errorMessage,
    // * current tapped item
    @Default(-1) int currentTappedItemIndex,
  }) = _SettingViewModelState;
}
