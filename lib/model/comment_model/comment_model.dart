import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel({
   @JsonKey(name: "user_name") required String userName,
   @JsonKey(name: "receiver_id") required String receiverId,
   @JsonKey(name: "user_image_url") String? userImageUrl,
    required String comment,
  @JsonKey(name: "task_id") required String taskId,
   @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
