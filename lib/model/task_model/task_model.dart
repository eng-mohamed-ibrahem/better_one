import 'dart:convert';

import 'package:better_one/core/enum/task_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class TaskModel with _$TaskModel {
  const TaskModel._();
  const factory TaskModel({
    required String title,
    @JsonKey(name: 'sub_tasks') required List<SubTask> subTasks,
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'elapsed_time') @Default(Duration.zero) Duration elapsedTime,
    @Default(TaskStatus.created) TaskStatus status,
    @Default(false) bool backup,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  String asString() => json.encode(toJson());

  factory TaskModel.fromString(String src) =>
      TaskModel.fromJson(json.decode(src));
}

@freezed
class SubTask with _$SubTask {
  const factory SubTask({
    @Default(false) bool completed,
    required String title,
  }) = _SubTask;

  factory SubTask.fromJson(Map<String, dynamic> json) =>
      _$SubTaskFromJson(json);
}
