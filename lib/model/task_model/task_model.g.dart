// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      title: json['title'] as String,
      body: json['body'] as String,
      subTasks: (json['subTasks'] as List<dynamic>?)
              ?.map((e) => _$recordConvert(
                    e,
                    ($jsonValue) => (
                      completed: $jsonValue['completed'] as bool,
                      title: $jsonValue['title'] as String,
                    ),
                  ))
              .toList() ??
          const [],
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      elapsedTime: json['elapsedTime'] == null
          ? Duration.zero
          : Duration(microseconds: json['elapsedTime'] as int),
      status: $enumDecodeNullable(_$TaskStatusEnumMap, json['status']) ??
          TaskStatus.none,
      backup: json['backup'] as bool? ?? false,
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'subTasks': instance.subTasks
          .map((e) => {
                'completed': e.completed,
                'title': e.title,
              })
          .toList(),
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'elapsedTime': instance.elapsedTime.inMicroseconds,
      'status': _$TaskStatusEnumMap[instance.status]!,
      'backup': instance.backup,
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);

const _$TaskStatusEnumMap = {
  TaskStatus.done: 'done',
  TaskStatus.inprogress: 'inprogress',
  TaskStatus.paused: 'paused',
  TaskStatus.none: 'none',
};
