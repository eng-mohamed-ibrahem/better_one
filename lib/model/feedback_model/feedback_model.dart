import 'package:better_one/core/enum/feedback_cat_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_model.freezed.dart';

part 'feedback_model.g.dart';

@freezed
class FeedbackModel with _$FeedbackModel {
  const factory FeedbackModel({
    required FeedbackCatEnum feedbackCat,
    required String feedback,
    required DateTime timeStamp,
    required String userId,
    required String userName,
    required String email,
    String? attachmentUrl,
  }) = _FeedbackModel;

  factory FeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelFromJson(json);
}
