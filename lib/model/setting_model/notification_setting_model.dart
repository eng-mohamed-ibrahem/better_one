import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_setting_model.freezed.dart';
part 'notification_setting_model.g.dart';

@freezed
class NotificationSettingModel with _$NotificationSettingModel {
  const NotificationSettingModel._();
  const factory NotificationSettingModel({
    @JsonKey(name: "send_on_add") @Default(true) bool sendOnAdd,
    @JsonKey(name: "send_on_update") @Default(true) bool sendOnUpdate,
    @JsonKey(name: "send_on_complete") @Default(true) bool sendOnComplete,
   @JsonKey(name: "mute_notification") @Default(false) bool muteNotification,
  }) = _NotificationSettingModel;

  factory NotificationSettingModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingModelFromJson(json);

  String asString() => json.encode(toJson());

  factory NotificationSettingModel.fromString(String src) =>
      NotificationSettingModel.fromJson(json.decode(src));
}
