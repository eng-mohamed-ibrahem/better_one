import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:better_one/core/enum/note_status.dart';

part 'note_model.freezed.dart';
part 'note_model.g.dart';

@freezed
class NoteModel with _$NoteModel {
  const factory NoteModel({
    required String title,
    required String body,
    required String id,
    required DateTime createdAt,
    DateTime? updatedAt,
    @Default(Duration.zero) Duration elapsedTime,
    @Default(NoteStatus.none) NoteStatus status,
  }) = _NoteModel;

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);
}
