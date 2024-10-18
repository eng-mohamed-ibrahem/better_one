// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/model/event_calendar_model/event_calendar_model.dart';
import 'package:better_one/model/setting_model/notification_setting_model.dart';
import 'package:better_one/model/setting_model/search_setting_model.dart';
import 'package:better_one/repositories/setting_repo/settings_repo_interface.dart';
import 'package:better_one/repositories/user_repo/user_repo_intefrace.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_viewmode.freezed.dart';
part 'setting_viewmode_state.dart';

class SettingViewmodel extends Cubit<SettingViewmodelState> {
  SettingViewmodel({required this.settingsRepo}) : super(const _Initial());
  final SettingsRepoInterface settingsRepo;

  Locale? currentLanguage;
  late SearchSettingModel searchSetting;
  late NotificationSettingModel notificationSetting;

  void changeLanguage(Locale language) async {
    var result = await settingsRepo.changeLanguage(language);
    result.when(
      success: (language) {
        currentLanguage = language;
        emit(_ChangeLanguageCompleted(currentLanguage: language));
      },
      failure: (failure) {
        emit(
          _ChangeLanguageFailed(
            message: failure.message,
            failure: failure,
          ),
        );
      },
    );
  }

  void getLanguage() async {
    emit(const _GetLanguageLoading());
    var result = await settingsRepo.getLanguage();
    result.when(
      success: (language) {
        currentLanguage = language;
        emit(
          _GetLanguageCompleted(currentLanguage: language),
        );
      },
      failure: (failure) {
        emit(
          _GetLanguageFailed(
            message: failure.message,
            failure: failure,
          ),
        );
      },
    );
  }

  void searchBy({bool? title, bool? body}) async {
    var search = SearchSettingModel(
      searchByTitle: title ?? searchSetting.searchByTitle,
      searchByBody: body ?? searchSetting.searchByBody,
    );

    var result = await settingsRepo.setSearchSettings(
      searchSettings: search,
    );
    result.when(
      success: (_) {
        searchSetting = search;
        emit(_SetSearchSettingsCompleted(newsearchSettings: search));
      },
      failure: (failure) {
        emit(
          _SetSearchSettingsFailed(
            message: failure.message,
            failure: failure,
          ),
        );
      },
    );
  }

  void getSearchSettings() async {
    emit(const _GetSearchSettingsLoading());
    var result = await settingsRepo.getSearchSettings();
    result.when(
      success: (searchSettings) {
        searchSetting = searchSettings;
        emit(const _GetSearchSettingsCompleted());
      },
      failure: (failure) {
        emit(
          _GetSearchSettingsFailed(
            message: failure.message,
            failure: failure,
          ),
        );
      },
    );
  }

  void setNotificationSettings({
    bool? sendOnAdd,
    bool? sendOnUpdate,
    bool? sendOnComplete,
    bool? muteNotification,
  }) async {
    var notification = NotificationSettingModel(
      sendOnAdd: sendOnAdd ?? notificationSetting.sendOnAdd,
      sendOnUpdate: sendOnUpdate ?? notificationSetting.sendOnUpdate,
      sendOnComplete: sendOnComplete ?? notificationSetting.sendOnComplete,
      muteNotification: muteNotification ?? notificationSetting.muteNotification,
    );
    var result = await settingsRepo.setNotificationSettings(
      notificationSettings: notification,
    );
    result.when(
      success: (value) {
        notificationSetting = notification;
        emit(_SetNotificationSettingsCompleted(
            newNotificationSettings: notification));
      },
      failure: (failure) {
        emit(
          _SetNotificationSettingsFailed(
            message: failure.message,
            failure: failure,
          ),
        );
      },
    );
  }

  void getNotificationSettings() async {
    emit(const _GetNotificationSettingsLoading());
    var result = await settingsRepo.getNotificationSettings();
    result.when(
      success: (notificationSettings) async {
        notificationSetting = notificationSettings;
        emit(const _GetNotificationSettingsCompleted());
      },
      failure: (failure) {
        emit(
          _GetNotificationSettingsFailed(
            message: failure.message,
            failure: failure,
          ),
        );
      },
    );
  }

  void createEvent(
      {required EventCalendarModel event,
      required UserRepoInterface userRepo}) async {
    emit(const _CreateEventLoading());
    var result = await userRepo.createEvent(event);
    result.when(
      success: (_) {
        emit(_CreateEventCompleted(event: event));
      },
      failure: (failure) {
        emit(
          _CreateEventFailed(
            message:
                failure is OtherFailure ? "core.error".tr() : failure.message,
            failure: failure,
          ),
        );
      },
    );
  }
}
