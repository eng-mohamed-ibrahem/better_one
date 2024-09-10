// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      title: json['title'] as String,
      subTasks: (json['sub_tasks'] as List<dynamic>)
          .map((e) => SubTask.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'sub_tasks': instance.subTasks.map((e) => e.toJson()).toList(),
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'elapsed_time': instance.elapsedTime.inMicroseconds,
      'status': _$TaskStatusEnumMap[instance.status]!,
      'backup': instance.backup,
    };

const _$TaskStatusEnumMap = {
  TaskStatus.done: 'done',
  TaskStatus.inprogress: 'inprogress',
  TaskStatus.paused: 'paused',
  TaskStatus.created: 'created',
};

_$SubTaskImpl _$$SubTaskImplFromJson(Map<String, dynamic> json) =>
    _$SubTaskImpl(
      completed: json['completed'] as bool? ?? false,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$SubTaskImplToJson(_$SubTaskImpl instance) =>
    <String, dynamic>{
      'completed': instance.completed,
      'title': instance.title,
    };
