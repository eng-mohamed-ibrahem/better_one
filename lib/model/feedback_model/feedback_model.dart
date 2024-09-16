import 'package:better_one/core/enum/feedback_cat_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_model.freezed.dart';
part 'feedback_model.g.dart';

@freezed
class FeedbackModel with _$FeedbackModel {
  const factory FeedbackModel({
    @JsonKey(name: "feedback_cat") required FeedbackCatEnum feedbackCat,
    required String feedback,
    required DateTime timeStamp,
    @JsonKey(name: "user_id") required String userId,
    @JsonKey(name: "user_name") required String userName,
    required String email,
    @JsonKey(name: "device_info") DeviceInfo? deviceInfo,
    @JsonKey(name: "attachment_url") String? attachmentUrl,
  }) = _FeedbackModel;

  factory FeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelFromJson(json);
}

@freezed
class DeviceInfo with _$DeviceInfo {
  const factory DeviceInfo({
    @JsonKey(name: "device_name") required String deviceName,
    @JsonKey(name: "device_model") required String deviceModel,
    @JsonKey(name: "device_os") required String deviceOs,
    @JsonKey(name: "device_os_version") required String deviceOsVersion,
  }) = _DeviceInfo;

  factory DeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoFromJson(json);

  @override
  String toString() {
    return '[\ndeviceName: $deviceName,\ndeviceModel: $deviceModel, \ndeviceOs: $deviceOs, \ndeviceOsVersion: $deviceOsVersion,\n]';
  }
}
