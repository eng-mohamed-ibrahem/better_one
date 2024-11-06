// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentModelImpl _$$CommentModelImplFromJson(Map<String, dynamic> json) =>
    _$CommentModelImpl(
      id: json['id'] as String,
      userName: json['user_name'] as String,
      senderId: json['sender_id'] as String,
      userImageUrl: json['user_image_url'] as String?,
      comment: json['comment'] as String,
      taskId: json['task_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      usersReactions: (json['users_reactions'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, $enumDecode(_$ReactionStatusEnumMap, e)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$CommentModelImplToJson(_$CommentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'sender_id': instance.senderId,
      'user_image_url': instance.userImageUrl,
      'comment': instance.comment,
      'task_id': instance.taskId,
      'created_at': instance.createdAt.toIso8601String(),
      'users_reactions': instance.usersReactions
          .map((k, e) => MapEntry(k, _$ReactionStatusEnumMap[e]!)),
    };

const _$ReactionStatusEnumMap = {
  ReactionStatus.like: 'like',
  ReactionStatus.none: 'none',
};
