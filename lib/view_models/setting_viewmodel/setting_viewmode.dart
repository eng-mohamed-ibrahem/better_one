import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/repositories/setting_repo/settings_repo_interface.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/constants/constants.dart';

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
    var result = await settingsRepo.setSearchSettings(
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
            isSetSearchSettingsCompleted: false,
            isSetSearchSettingsFailed: true,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  void getSearchSettings() async {
    var result = await settingsRepo.getSearchSettings();
    result.when(
      success: (searchSettings) {
        emit(
          release().copyWith(
            isGetSearchSettingsCompleted: true,
            isSearchByTitle: searchSettings[CacheKeys.isSearchByTitle]!,
            isSearchByBody: searchSettings[CacheKeys.isSearchByBody]!,
            isSearchByDate: searchSettings[CacheKeys.isSearchByDate]!,
            isSearchByStatus: searchSettings[CacheKeys.isSearchByStatus]!,
          ),
        );
      },
      failure: (failure) {
        emit(
          release().copyWith(
            isGetSearchSettingsCompleted: false,
            isGetSearchSettingsFailed: true,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  void setNotificationSettings({
    bool? isNotificationOnAdd,
    bool? isNotificationOnUpdate,
    bool? isNotificationOnComplete,
    bool? isNotificationOnReminder,
    DateTime? reminderDateTime,
    bool? repeatReminder,
  }) async {
    emit(release().copyWith(
      isNotificationSettingsLoading: true,
    ));
    var result = await settingsRepo.setNotificationSettings(
      isNotificationOnAdd: isNotificationOnAdd,
      isNotificationOnUpdate: isNotificationOnUpdate,
      isNotificationOnComplete: isNotificationOnComplete,
      isNotificationOnReminder: isNotificationOnReminder,
      reminderDateTime: reminderDateTime,
      repeatReminder: repeatReminder,
    );
    result.when(
      success: (value) {
        emit(
          release().copyWith(
            isNotificationSettingsLoading: false,
            isNotificationSettingsCompleted: true,
            isNotificationOnAdd:
                isNotificationOnAdd ?? state.isNotificationOnAdd,
            isNotificationOnUpdate:
                isNotificationOnUpdate ?? state.isNotificationOnUpdate,
            isNotificationOnComplete:
                isNotificationOnComplete ?? state.isNotificationOnComplete,
            isNotificationOnReminder:
                isNotificationOnReminder ?? state.isNotificationOnReminder,
            reminderDateTime: reminderDateTime ?? state.reminderDateTime,
            repeatReminder: repeatReminder ?? state.repeatReminder,
          ),
        );
        scheduleNotification();
      },
      failure: (failure) {
        emit(
          release().copyWith(
            isNotificationSettingsLoading: false,
            isNotificationSettingsCompleted: false,
            isNotificationSettingsFailed: true,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  void getNotificationSettings() async {
    var result = await settingsRepo.getNotificationSettings();
    result.when(
      success: (notificationSettings) async {
        emit(
          release().copyWith(
            isNotificationSettingsCompleted: true,
            isNotificationOnAdd:
                notificationSettings[CacheKeys.isNotificationOnAdd]!,
            isNotificationOnUpdate:
                notificationSettings[CacheKeys.isNotificationOnUpdate]!,
            isNotificationOnComplete:
                notificationSettings[CacheKeys.isNotificationOnComplete]!,
            isNotificationOnReminder:
                notificationSettings[CacheKeys.isNotificationOnReminder]!,
            reminderDateTime: notificationSettings[CacheKeys.reminderDateTime],
            repeatReminder: notificationSettings[CacheKeys.repeatReminder],
          ),
        );
      },
      failure: (failure) {
        emit(
          release().copyWith(
            isNotificationSettingsCompleted: false,
            isNotificationSettingsFailed: true,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  /// schedule notification
  void scheduleNotification() async {
    state.isNotificationOnReminder
        ? await localNotification.displaySchedule(
            repeatDaysWithSameTime: state.repeatReminder,
            scheduleTime: state.reminderDateTime!,
            notification: NotificationModel(
              id: NotificaitonConstants.scheduleNotificationId,
              title: 'task.motive_reminder'.tr(),
              body: 'task.motive_reminder_body'.tr(),
            ),
          )
        : localNotification.cancel(
            id: NotificaitonConstants.scheduleNotificationId);
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
      isGetSearchSettingsCompleted: false,
      isGetSearchSettingsFailed: false,
      isSetSearchSettingsCompleted: false,
      isSetSearchSettingsFailed: false,
      isNotificationSettingsLoading: false,
      isNotificationSettingsCompleted: false,
      isNotificationSettingsFailed: false,
      errorMessage: null,
    );
  }
}
