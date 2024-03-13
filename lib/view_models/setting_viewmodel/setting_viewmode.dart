import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
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

  void searchOn({
    bool? isSearchByTitle,
    bool? isSearchByBody,
    bool? isSearchByDate,
    bool? isSearchByStatus,
  }) async {
    var result = await settingRepo.setSearchSettings(
      isSearchByTitle: isSearchByTitle,
      isSearchByBody: isSearchByBody,
      isSearchByDate: isSearchByDate,
      isSearchByStatus: isSearchByStatus,
    );
    result.when(
      success: (value) {
        emit(
          release().copyWith(
            isSetSearchSettingsCompleted: true,
            isSearchByTitle: isSearchByTitle ?? state.isSearchByTitle,
            isSearchByBody: isSearchByBody ?? state.isSearchByBody,
            isSearchByDate: isSearchByDate ?? state.isSearchByDate,
            isSearchByStatus: isSearchByStatus ?? state.isSearchByStatus,
          ),
        );
      },
      failure: (failure) {
        emit(
          release().copyWith(
            isSetSearchSettingsLoading: false,
            isSetSearchSettingsCompleted: false,
            isSetSearchSettingsFailed: true,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  void getSearchSettings() async {
    var result = await settingRepo.getSearchSettings();
    result.when(
      success: (searchSettings) {
        emit(release().copyWith(
          isGetSearchSettingsCompleted: true,
          isSearchByTitle: searchSettings['isSearchByTitle']!,
          isSearchByBody: searchSettings['isSearchByBody']!,
          isSearchByDate: searchSettings['isSearchByDate']!,
          isSearchByStatus: searchSettings['isSearchByStatus']!,
        ));
      },
      failure: (failure) {
        emit(
          release().copyWith(
            isGetSearchSettingsLoading: false,
            isGetSearchSettingsCompleted: false,
            isGetSearchSettingsFailed: true,
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
      isChangeLanguageCompleted: false,
      isGetLanguageCompleted: false,
      errorMessage: null,
    );
  }
}
