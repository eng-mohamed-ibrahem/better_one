// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackModelImpl _$$FeedbackModelImplFromJson(Map<String, dynamic> json) =>
    _$FeedbackModelImpl(
      feedbackCat: $enumDecode(_$FeedbackCatEnumEnumMap, json['feedbackCat']),
      feedback: json['feedback'] as String,
      timeStamp: DateTime.parse(json['timeStamp'] as String),
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      attachmentUrl: json['attachmentUrl'] as String?,
    );

Map<String, dynamic> _$$FeedbackModelImplToJson(_$FeedbackModelImpl instance) =>
    <String, dynamic>{
      'feedbackCat': _$FeedbackCatEnumEnumMap[instance.feedbackCat]!,
      'feedback': instance.feedback,
      'timeStamp': instance.timeStamp.toIso8601String(),
      'userId': instance.userId,
      'userName': instance.userName,
      'email': instance.email,
      'attachmentUrl': instance.attachmentUrl,
    };

const _$FeedbackCatEnumEnumMap = {
  FeedbackCatEnum.technical: 'technical',
  FeedbackCatEnum.suggestions: 'suggestions',
  FeedbackCatEnum.enhancement: 'enhancement',
  FeedbackCatEnum.feature: 'feature',
  FeedbackCatEnum.problem: 'problem',
  FeedbackCatEnum.encouragement: 'encouragement',
  FeedbackCatEnum.other: 'other',
};
