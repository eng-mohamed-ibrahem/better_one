part of 'setting_viewmode.dart';

@freezed
class SettingViewModelState with _$SettingViewModelState {
  const factory SettingViewModelState({
    @Default(true) bool isInitial,
    @Default(false) bool isLoading,
    @Default(false) bool isCompleted,
    @Default(false) bool isFailed,
    @Default(null) String? errorMessage,
  }) = _SettingViewModelState;
}
