// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeedbackModel _$FeedbackModelFromJson(Map<String, dynamic> json) {
  return _FeedbackModel.fromJson(json);
}

/// @nodoc
mixin _$FeedbackModel {
  @JsonKey(name: "feedback_cat")
  FeedbackCatEnum get feedbackCat => throw _privateConstructorUsedError;
  String get feedback => throw _privateConstructorUsedError;
  DateTime get timeStamp => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "user_name")
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "device_info")
  DeviceInfo? get deviceInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "attachment_url")
  String? get attachmentUrl => throw _privateConstructorUsedError;

  /// Serializes this FeedbackModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedbackModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedbackModelCopyWith<FeedbackModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackModelCopyWith<$Res> {
  factory $FeedbackModelCopyWith(
          FeedbackModel value, $Res Function(FeedbackModel) then) =
      _$FeedbackModelCopyWithImpl<$Res, FeedbackModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "feedback_cat") FeedbackCatEnum feedbackCat,
      String feedback,
      DateTime timeStamp,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "user_name") String userName,
      String email,
      @JsonKey(name: "device_info") DeviceInfo? deviceInfo,
      @JsonKey(name: "attachment_url") String? attachmentUrl});

  $DeviceInfoCopyWith<$Res>? get deviceInfo;
}

/// @nodoc
class _$FeedbackModelCopyWithImpl<$Res, $Val extends FeedbackModel>
    implements $FeedbackModelCopyWith<$Res> {
  _$FeedbackModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedbackModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedbackCat = null,
    Object? feedback = null,
    Object? timeStamp = null,
    Object? userId = null,
    Object? userName = null,
    Object? email = null,
    Object? deviceInfo = freezed,
    Object? attachmentUrl = freezed,
  }) {
    return _then(_value.copyWith(
      feedbackCat: null == feedbackCat
          ? _value.feedbackCat
          : feedbackCat // ignore: cast_nullable_to_non_nullable
              as FeedbackCatEnum,
      feedback: null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfo?,
      attachmentUrl: freezed == attachmentUrl
          ? _value.attachmentUrl
          : attachmentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of FeedbackModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceInfoCopyWith<$Res>? get deviceInfo {
    if (_value.deviceInfo == null) {
      return null;
    }

    return $DeviceInfoCopyWith<$Res>(_value.deviceInfo!, (value) {
      return _then(_value.copyWith(deviceInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeedbackModelImplCopyWith<$Res>
    implements $FeedbackModelCopyWith<$Res> {
  factory _$$FeedbackModelImplCopyWith(
          _$FeedbackModelImpl value, $Res Function(_$FeedbackModelImpl) then) =
      __$$FeedbackModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "feedback_cat") FeedbackCatEnum feedbackCat,
      String feedback,
      DateTime timeStamp,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "user_name") String userName,
      String email,
      @JsonKey(name: "device_info") DeviceInfo? deviceInfo,
      @JsonKey(name: "attachment_url") String? attachmentUrl});

  @override
  $DeviceInfoCopyWith<$Res>? get deviceInfo;
}

/// @nodoc
class __$$FeedbackModelImplCopyWithImpl<$Res>
    extends _$FeedbackModelCopyWithImpl<$Res, _$FeedbackModelImpl>
    implements _$$FeedbackModelImplCopyWith<$Res> {
  __$$FeedbackModelImplCopyWithImpl(
      _$FeedbackModelImpl _value, $Res Function(_$FeedbackModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedbackModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedbackCat = null,
    Object? feedback = null,
    Object? timeStamp = null,
    Object? userId = null,
    Object? userName = null,
    Object? email = null,
    Object? deviceInfo = freezed,
    Object? attachmentUrl = freezed,
  }) {
    return _then(_$FeedbackModelImpl(
      feedbackCat: null == feedbackCat
          ? _value.feedbackCat
          : feedbackCat // ignore: cast_nullable_to_non_nullable
              as FeedbackCatEnum,
      feedback: null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfo?,
      attachmentUrl: freezed == attachmentUrl
          ? _value.attachmentUrl
          : attachmentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackModelImpl implements _FeedbackModel {
  const _$FeedbackModelImpl(
      {@JsonKey(name: "feedback_cat") required this.feedbackCat,
      required this.feedback,
      required this.timeStamp,
      @JsonKey(name: "user_id") required this.userId,
      @JsonKey(name: "user_name") required this.userName,
      required this.email,
      @JsonKey(name: "device_info") this.deviceInfo,
      @JsonKey(name: "attachment_url") this.attachmentUrl});

  factory _$FeedbackModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackModelImplFromJson(json);

  @override
  @JsonKey(name: "feedback_cat")
  final FeedbackCatEnum feedbackCat;
  @override
  final String feedback;
  @override
  final DateTime timeStamp;
  @override
  @JsonKey(name: "user_id")
  final String userId;
  @override
  @JsonKey(name: "user_name")
  final String userName;
  @override
  final String email;
  @override
  @JsonKey(name: "device_info")
  final DeviceInfo? deviceInfo;
  @override
  @JsonKey(name: "attachment_url")
  final String? attachmentUrl;

  @override
  String toString() {
    return 'FeedbackModel(feedbackCat: $feedbackCat, feedback: $feedback, timeStamp: $timeStamp, userId: $userId, userName: $userName, email: $email, deviceInfo: $deviceInfo, attachmentUrl: $attachmentUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackModelImpl &&
            (identical(other.feedbackCat, feedbackCat) ||
                other.feedbackCat == feedbackCat) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.deviceInfo, deviceInfo) ||
                other.deviceInfo == deviceInfo) &&
            (identical(other.attachmentUrl, attachmentUrl) ||
                other.attachmentUrl == attachmentUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, feedbackCat, feedback, timeStamp,
      userId, userName, email, deviceInfo, attachmentUrl);

  /// Create a copy of FeedbackModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackModelImplCopyWith<_$FeedbackModelImpl> get copyWith =>
      __$$FeedbackModelImplCopyWithImpl<_$FeedbackModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackModelImplToJson(
      this,
    );
  }
}

abstract class _FeedbackModel implements FeedbackModel {
  const factory _FeedbackModel(
          {@JsonKey(name: "feedback_cat")
          required final FeedbackCatEnum feedbackCat,
          required final String feedback,
          required final DateTime timeStamp,
          @JsonKey(name: "user_id") required final String userId,
          @JsonKey(name: "user_name") required final String userName,
          required final String email,
          @JsonKey(name: "device_info") final DeviceInfo? deviceInfo,
          @JsonKey(name: "attachment_url") final String? attachmentUrl}) =
      _$FeedbackModelImpl;

  factory _FeedbackModel.fromJson(Map<String, dynamic> json) =
      _$FeedbackModelImpl.fromJson;

  @override
  @JsonKey(name: "feedback_cat")
  FeedbackCatEnum get feedbackCat;
  @override
  String get feedback;
  @override
  DateTime get timeStamp;
  @override
  @JsonKey(name: "user_id")
  String get userId;
  @override
  @JsonKey(name: "user_name")
  String get userName;
  @override
  String get email;
  @override
  @JsonKey(name: "device_info")
  DeviceInfo? get deviceInfo;
  @override
  @JsonKey(name: "attachment_url")
  String? get attachmentUrl;

  /// Create a copy of FeedbackModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackModelImplCopyWith<_$FeedbackModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeviceInfo _$DeviceInfoFromJson(Map<String, dynamic> json) {
  return _DeviceInfo.fromJson(json);
}

/// @nodoc
mixin _$DeviceInfo {
  @JsonKey(name: "device_name")
  String get deviceName => throw _privateConstructorUsedError;
  @JsonKey(name: "device_model")
  String get deviceModel => throw _privateConstructorUsedError;
  @JsonKey(name: "device_os")
  String get deviceOs => throw _privateConstructorUsedError;
  @JsonKey(name: "device_os_version")
  String get deviceOsVersion => throw _privateConstructorUsedError;

  /// Serializes this DeviceInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceInfoCopyWith<DeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceInfoCopyWith<$Res> {
  factory $DeviceInfoCopyWith(
          DeviceInfo value, $Res Function(DeviceInfo) then) =
      _$DeviceInfoCopyWithImpl<$Res, DeviceInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: "device_name") String deviceName,
      @JsonKey(name: "device_model") String deviceModel,
      @JsonKey(name: "device_os") String deviceOs,
      @JsonKey(name: "device_os_version") String deviceOsVersion});
}

/// @nodoc
class _$DeviceInfoCopyWithImpl<$Res, $Val extends DeviceInfo>
    implements $DeviceInfoCopyWith<$Res> {
  _$DeviceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceName = null,
    Object? deviceModel = null,
    Object? deviceOs = null,
    Object? deviceOsVersion = null,
  }) {
    return _then(_value.copyWith(
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      deviceModel: null == deviceModel
          ? _value.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as String,
      deviceOs: null == deviceOs
          ? _value.deviceOs
          : deviceOs // ignore: cast_nullable_to_non_nullable
              as String,
      deviceOsVersion: null == deviceOsVersion
          ? _value.deviceOsVersion
          : deviceOsVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceInfoImplCopyWith<$Res>
    implements $DeviceInfoCopyWith<$Res> {
  factory _$$DeviceInfoImplCopyWith(
          _$DeviceInfoImpl value, $Res Function(_$DeviceInfoImpl) then) =
      __$$DeviceInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "device_name") String deviceName,
      @JsonKey(name: "device_model") String deviceModel,
      @JsonKey(name: "device_os") String deviceOs,
      @JsonKey(name: "device_os_version") String deviceOsVersion});
}

/// @nodoc
class __$$DeviceInfoImplCopyWithImpl<$Res>
    extends _$DeviceInfoCopyWithImpl<$Res, _$DeviceInfoImpl>
    implements _$$DeviceInfoImplCopyWith<$Res> {
  __$$DeviceInfoImplCopyWithImpl(
      _$DeviceInfoImpl _value, $Res Function(_$DeviceInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceName = null,
    Object? deviceModel = null,
    Object? deviceOs = null,
    Object? deviceOsVersion = null,
  }) {
    return _then(_$DeviceInfoImpl(
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      deviceModel: null == deviceModel
          ? _value.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as String,
      deviceOs: null == deviceOs
          ? _value.deviceOs
          : deviceOs // ignore: cast_nullable_to_non_nullable
              as String,
      deviceOsVersion: null == deviceOsVersion
          ? _value.deviceOsVersion
          : deviceOsVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceInfoImpl implements _DeviceInfo {
  const _$DeviceInfoImpl(
      {@JsonKey(name: "device_name") required this.deviceName,
      @JsonKey(name: "device_model") required this.deviceModel,
      @JsonKey(name: "device_os") required this.deviceOs,
      @JsonKey(name: "device_os_version") required this.deviceOsVersion});

  factory _$DeviceInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceInfoImplFromJson(json);

  @override
  @JsonKey(name: "device_name")
  final String deviceName;
  @override
  @JsonKey(name: "device_model")
  final String deviceModel;
  @override
  @JsonKey(name: "device_os")
  final String deviceOs;
  @override
  @JsonKey(name: "device_os_version")
  final String deviceOsVersion;

  @override
  String toString() {
    return 'DeviceInfo(deviceName: $deviceName, deviceModel: $deviceModel, deviceOs: $deviceOs, deviceOsVersion: $deviceOsVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceInfoImpl &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.deviceModel, deviceModel) ||
                other.deviceModel == deviceModel) &&
            (identical(other.deviceOs, deviceOs) ||
                other.deviceOs == deviceOs) &&
            (identical(other.deviceOsVersion, deviceOsVersion) ||
                other.deviceOsVersion == deviceOsVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, deviceName, deviceModel, deviceOs, deviceOsVersion);

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceInfoImplCopyWith<_$DeviceInfoImpl> get copyWith =>
      __$$DeviceInfoImplCopyWithImpl<_$DeviceInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceInfoImplToJson(
      this,
    );
  }
}

abstract class _DeviceInfo implements DeviceInfo {
  const factory _DeviceInfo(
      {@JsonKey(name: "device_name") required final String deviceName,
      @JsonKey(name: "device_model") required final String deviceModel,
      @JsonKey(name: "device_os") required final String deviceOs,
      @JsonKey(name: "device_os_version")
      required final String deviceOsVersion}) = _$DeviceInfoImpl;

  factory _DeviceInfo.fromJson(Map<String, dynamic> json) =
      _$DeviceInfoImpl.fromJson;

  @override
  @JsonKey(name: "device_name")
  String get deviceName;
  @override
  @JsonKey(name: "device_model")
  String get deviceModel;
  @override
  @JsonKey(name: "device_os")
  String get deviceOs;
  @override
  @JsonKey(name: "device_os_version")
  String get deviceOsVersion;

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceInfoImplCopyWith<_$DeviceInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
