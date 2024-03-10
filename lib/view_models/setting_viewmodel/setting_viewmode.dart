import 'package:better_one/repositories/setting_repo/settings_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_viewmode.freezed.dart';
part 'setting_viewmode_state.dart';

class SettingViewModel extends Cubit<SettingViewModelState> {
  SettingViewModel({required this.settingsRepo})
      : super(const SettingViewModelState());
  final SettingsRepoInterface settingsRepo;

  static SettingViewModel get(context) =>
      BlocProvider.of<SettingViewModel>(context);

  void changeLanguage(Locale language) async {
    emit(release().copyWith(isChangeLanguageLoading: true));
    var result = await settingsRepo.changeLanguage(language);
    result.when(
      success: (language) {
        emit(state.copyWith(
          isChangeLanguageLoading: false,
          isChangeLanguageCompleted: true,
          currentLanguage: language,
        ));
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isChangeLanguageLoading: false,
            isChangeLanguageCompleted: false,
            isChangeLanguageFailed: true,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  void getLanguage() async {
    emit(release().copyWith(isGetLanguageLoading: true));
    var result = await settingsRepo.getLanguage();
    result.when(
      success: (language) {
        emit(
          state.copyWith(
            isGetLanguageLoading: false,
            isGetLanguageCompleted: true,
            currentLanguage: language,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isGetLanguageLoading: false,
            isGetLanguageCompleted: false,
            isGetLanguageFailed: true,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  void toggleTheme() async {
    emit(release().copyWith(isToggleThemeLoading: true));
    var result = await settingsRepo.toggleTheme();
    result.when(
      success: (theme) {
        emit(
          state.copyWith(
            isToggleThemeLoading: false,
            isToggleThemeCompleted: true,
            currentTheme: theme,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isToggleThemeLoading: false,
            isToggleThemeCompleted: false,
            isToggleThemeFailed: true,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  void getTheme() async {
    emit(release().copyWith(isGetThemeLoading: true));
    var result = await settingsRepo.getTheme();
    result.when(
      success: (theme) {
        emit(
          state.copyWith(
            isGetThemeLoading: false,
            isGetThemeCompleted: true,
            currentTheme: theme,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isGetThemeLoading: false,
            isGetThemeCompleted: false,
            isGetThemeFailed: true,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  void setCurrentTappedItemIndex(int index) {
    emit(release().copyWith(currentTappedItemIndex: index));
  }

  SettingViewModelState release() {
    return state.copyWith(
      isInitial: false,
      isChangeLanguageLoading: false,
      isChangeLanguageFailed: false,
      isGetLanguageLoading: false,
      isGetLanguageFailed: false,
      isToggleThemeCompleted: false,
      isChangeLanguageCompleted: false,
      isGetLanguageCompleted: false,
      isGetThemeCompleted: false,
      isToggleThemeLoading: false,
      isToggleThemeFailed: false,
      isGetThemeLoading: false,
      isGetThemeFailed: false,
      errorMessage: null,
    );
  }
}
