import 'package:better_one/repositories/setting_repo/settings_repo_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_viewmodel.freezed.dart';
part 'theme_viewmodel_state.dart';

class ThemeViewModel extends Cubit<ThemeViewModelState> {
  ThemeViewModel({
    required this.settingsRepo,
  }) : super(const ThemeViewModelState());
  final SettingsRepoInterface settingsRepo;

  static ThemeViewModel get(context) =>
      BlocProvider.of<ThemeViewModel>(context);

  void toggleTheme() async {
    emit(release().copyWith(isToggleThemeLoading: true));
    var result = await settingsRepo.toggleTheme();
    result.when(
      success: (theme) {
        emit(
          state.copyWith(
            isToggleThemeLoading: false,
            isToggleThemeCompleted: true,
            currentThemeMode: theme,
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
            currentThemeMode: theme,
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

  ThemeViewModelState release() {
    return state.copyWith(
      isToggleThemeLoading: false,
      isToggleThemeCompleted: false,
      isToggleThemeFailed: false,
      isGetThemeLoading: false,
      isGetThemeCompleted: false,
      isGetThemeFailed: false,
      errorMessage: null,
    );
  }
}
