// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackModelImpl _$$FeedbackModelImplFromJson(Map<String, dynamic> json) =>
    _$FeedbackModelImpl(
      feedbackCat: $enumDecode(_$FeedbackCatEnumEnumMap, json['feedback_cat']),
      feedback: json['feedback'] as String,
      timeStamp: DateTime.parse(json['timeStamp'] as String),
      userId: json['user_id'] as String,
      userName: json['user_name'] as String,
      email: json['email'] as String,
      deviceInfo: json['device_info'] == null
          ? null
          : DeviceInfo.fromJson(json['device_info'] as Map<String, dynamic>),
      attachmentUrl: json['attachment_url'] as String?,
    );

Map<String, dynamic> _$$FeedbackModelImplToJson(_$FeedbackModelImpl instance) =>
    <String, dynamic>{
      'feedback_cat': _$FeedbackCatEnumEnumMap[instance.feedbackCat]!,
      'feedback': instance.feedback,
      'timeStamp': instance.timeStamp.toIso8601String(),
      'user_id': instance.userId,
      'user_name': instance.userName,
      'email': instance.email,
      'device_info': instance.deviceInfo,
      'attachment_url': instance.attachmentUrl,
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

_$DeviceInfoImpl _$$DeviceInfoImplFromJson(Map<String, dynamic> json) =>
    _$DeviceInfoImpl(
      deviceName: json['device_name'] as String,
      deviceModel: json['device_model'] as String,
      deviceOs: json['device_os'] as String,
      deviceOsVersion: json['device_os_version'] as String,
    );

Map<String, dynamic> _$$DeviceInfoImplToJson(_$DeviceInfoImpl instance) =>
    <String, dynamic>{
      'device_name': instance.deviceName,
      'device_model': instance.deviceModel,
      'device_os': instance.deviceOs,
      'device_os_version': instance.deviceOsVersion,
    };
