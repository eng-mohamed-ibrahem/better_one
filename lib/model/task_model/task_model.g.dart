// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      title: json['title'] as String,
      body: json['body'] as String,
      subTasks: (json['sub_tasks'] as List<dynamic>?)
              ?.map((e) => _$recordConvert(
                    e,
                    ($jsonValue) => (
                      completed: $jsonValue['completed'] as bool,
                      title: $jsonValue['title'] as String,
                    ),
                  ))
              .toList() ??
          const <SubTask>[],
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      elapsedTime: json['elapsed_time'] == null
          ? Duration.zero
          : Duration(microseconds: (json['elapsed_time'] as num).toInt()),
      status: $enumDecodeNullable(_$TaskStatusEnumMap, json['status']) ??
          TaskStatus.created,
      backup: json['backup'] as bool? ?? false,
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'sub_tasks': instance.subTasks
          .map((e) => <String, dynamic>{
                'completed': e.completed,
                'title': e.title,
              })
          .toList(),
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'elapsed_time': instance.elapsedTime.inMicroseconds,
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
  TaskStatus.created: 'created',
};
