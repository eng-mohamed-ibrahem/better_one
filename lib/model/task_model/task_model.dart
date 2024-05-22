import 'package:better_one/core/enum/task_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String title,
    required String body,
    @Default([]) List<({String title, bool completed})> subTasks,
    required String id,
    required DateTime createdAt,
    DateTime? updatedAt,
    @Default(Duration.zero) Duration elapsedTime,
    @Default(TaskStatus.none) TaskStatus status,
    @Default(false) bool backup,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
