// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoteModelImpl _$$NoteModelImplFromJson(Map<String, dynamic> json) =>
    _$NoteModelImpl(
      title: json['title'] as String?,
      body: json['body'] as String,
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      elapsedTime: json['elapsedTime'] == null
          ? Duration.zero
          : Duration(microseconds: json['elapsedTime'] as int),
      status: $enumDecodeNullable(_$NoteStatusEnumMap, json['status']) ??
          NoteStatus.progress,
    );

Map<String, dynamic> _$$NoteModelImplToJson(_$NoteModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'elapsedTime': instance.elapsedTime.inMicroseconds,
      'status': _$NoteStatusEnumMap[instance.status]!,
    };

const _$NoteStatusEnumMap = {
  NoteStatus.done: 'done',
  NoteStatus.progress: 'progress',
  NoteStatus.paused: 'paused',
};
