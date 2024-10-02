import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
   @JsonKey(name: "user_name") required String userName,
   @JsonKey(name: "sender_id") required String senderId,
   @JsonKey(name: "user_image_url") String? userImageUrl,
    required String comment,
    String? payload,
   @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
