part of 'theme_viewmodel.dart';

@freezed
class ThemeViewModelState with _$ThemeViewModelState {
  const factory ThemeViewModelState(
    {
      @Default(true) bool isInitial,
      @Default(false) bool isGetThemeLoading,
      @Default(false) bool isGetThemeCompleted,
      @Default(false) bool isGetThemeFailed,
      
      @Default(false) bool isToggleThemeLoading,
      @Default(false) bool isToggleThemeCompleted,
      @Default(false) bool isToggleThemeFailed,

      @Default(null) ThemeMode? currentThemeMode,
      @Default(null) String? errorMessage,
    }
  ) = _ThemeViewModelState;
}
