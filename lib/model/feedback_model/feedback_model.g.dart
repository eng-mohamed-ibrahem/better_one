// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackModelImpl _$$FeedbackModelImplFromJson(Map<String, dynamic> json) =>
    _$FeedbackModelImpl(
      emojiRate: json['emojiRate'] as String?,
      feedback: json['feedback'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      attachmentUrl: json['attachmentUrl'] as String?,
    );

Map<String, dynamic> _$$FeedbackModelImplToJson(_$FeedbackModelImpl instance) =>
    <String, dynamic>{
      'emojiRate': instance.emojiRate,
      'feedback': instance.feedback,
      'dateTime': instance.dateTime.toIso8601String(),
      'userId': instance.userId,
      'userName': instance.userName,
      'email': instance.email,
      'attachmentUrl': instance.attachmentUrl,
    };
