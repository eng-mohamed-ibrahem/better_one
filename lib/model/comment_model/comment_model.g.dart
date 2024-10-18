// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentModelImpl _$$CommentModelImplFromJson(Map<String, dynamic> json) =>
    _$CommentModelImpl(
      userName: json['user_name'] as String,
      receiverId: json['receiver_id'] as String,
      userImageUrl: json['user_image_url'] as String?,
      comment: json['comment'] as String,
      taskId: json['task_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$CommentModelImplToJson(_$CommentModelImpl instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'receiver_id': instance.receiverId,
      'user_image_url': instance.userImageUrl,
      'comment': instance.comment,
      'task_id': instance.taskId,
      'created_at': instance.createdAt.toIso8601String(),
    };
