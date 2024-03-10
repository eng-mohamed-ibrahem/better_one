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
    //* toggle theme
    @Default(false) bool isToggleThemeLoading,
    @Default(false) bool isToggleThemeCompleted,
    @Default(false) bool isToggleThemeFailed,
    //* get current theme
    @Default(false) bool isGetThemeLoading,
    @Default(false) bool isGetThemeCompleted,
    @Default(false) bool isGetThemeFailed,
    @Default(null) ThemeData? currentTheme,
    @Default(null) String? errorMessage,
    // * current tapped item
    @Default(-1) int currentTappedItemIndex,
  }) = _SettingViewModelState;
}
