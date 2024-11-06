import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CommentModel with _$CommentModel {
  const factory CommentModel({
    required String id,
    @JsonKey(name: "user_name") required String userName,
    @JsonKey(name: "sender_id") required String senderId,
    @JsonKey(name: "user_image_url") String? userImageUrl,
    required String comment,
    @JsonKey(name: "task_id") required String taskId,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "users_reactions")
    @Default({})
    Map<String, ReactionStatus> usersReactions,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}

enum ReactionStatus {
  like(Icon(FontAwesomeIcons.heartCircleCheck, color: Colors.red, size: 16)),
  none(Icon(FontAwesomeIcons.heartCirclePlus, color: Colors.grey, size: 16));

  final Widget icon;
  const ReactionStatus(this.icon);
}
