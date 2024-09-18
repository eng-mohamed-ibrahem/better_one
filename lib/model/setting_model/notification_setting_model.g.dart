// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationSettingModelImpl _$$NotificationSettingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationSettingModelImpl(
      sendOnAdd: json['send_on_add'] as bool? ?? true,
      sendOnUpdate: json['send_on_update'] as bool? ?? true,
      sendOnComplete: json['send_on_complete'] as bool? ?? true,
    );

Map<String, dynamic> _$$NotificationSettingModelImplToJson(
        _$NotificationSettingModelImpl instance) =>
    <String, dynamic>{
      'send_on_add': instance.sendOnAdd,
      'send_on_update': instance.sendOnUpdate,
      'send_on_complete': instance.sendOnComplete,
    };
