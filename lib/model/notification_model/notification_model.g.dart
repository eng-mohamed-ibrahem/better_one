// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      userName: json['userName'] as String,
      userImageUrl: json['userImageUrl'] as String?,
      comment: json['comment'] as String,
      payload: json['payload'] as String?,
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userImageUrl': instance.userImageUrl,
      'comment': instance.comment,
      'payload': instance.payload,
    };
