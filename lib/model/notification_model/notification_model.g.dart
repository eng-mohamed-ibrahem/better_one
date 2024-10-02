// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      userName: json['user_name'] as String,
      senderId: json['sender_id'] as String,
      userImageUrl: json['user_image_url'] as String?,
      comment: json['comment'] as String,
      payload: json['payload'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'sender_id': instance.senderId,
      'user_image_url': instance.userImageUrl,
      'comment': instance.comment,
      'payload': instance.payload,
      'created_at': instance.createdAt.toIso8601String(),
    };
