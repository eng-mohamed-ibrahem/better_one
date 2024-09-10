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
  String? get emojiRate => throw _privateConstructorUsedError;
  String get feedback => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
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
      {String? emojiRate,
      String feedback,
      DateTime dateTime,
      String userId,
      String userName,
      String email,
      String? attachmentUrl});
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
    Object? emojiRate = freezed,
    Object? feedback = null,
    Object? dateTime = null,
    Object? userId = null,
    Object? userName = null,
    Object? email = null,
    Object? attachmentUrl = freezed,
  }) {
    return _then(_value.copyWith(
      emojiRate: freezed == emojiRate
          ? _value.emojiRate
          : emojiRate // ignore: cast_nullable_to_non_nullable
              as String?,
      feedback: null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
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
      attachmentUrl: freezed == attachmentUrl
          ? _value.attachmentUrl
          : attachmentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
      {String? emojiRate,
      String feedback,
      DateTime dateTime,
      String userId,
      String userName,
      String email,
      String? attachmentUrl});
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
    Object? emojiRate = freezed,
    Object? feedback = null,
    Object? dateTime = null,
    Object? userId = null,
    Object? userName = null,
    Object? email = null,
    Object? attachmentUrl = freezed,
  }) {
    return _then(_$FeedbackModelImpl(
      emojiRate: freezed == emojiRate
          ? _value.emojiRate
          : emojiRate // ignore: cast_nullable_to_non_nullable
              as String?,
      feedback: null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
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
      {this.emojiRate,
      required this.feedback,
      required this.dateTime,
      required this.userId,
      required this.userName,
      required this.email,
      this.attachmentUrl});

  factory _$FeedbackModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackModelImplFromJson(json);

  @override
  final String? emojiRate;
  @override
  final String feedback;
  @override
  final DateTime dateTime;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String email;
  @override
  final String? attachmentUrl;

  @override
  String toString() {
    return 'FeedbackModel(emojiRate: $emojiRate, feedback: $feedback, dateTime: $dateTime, userId: $userId, userName: $userName, email: $email, attachmentUrl: $attachmentUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackModelImpl &&
            (identical(other.emojiRate, emojiRate) ||
                other.emojiRate == emojiRate) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.attachmentUrl, attachmentUrl) ||
                other.attachmentUrl == attachmentUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, emojiRate, feedback, dateTime,
      userId, userName, email, attachmentUrl);

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
      {final String? emojiRate,
      required final String feedback,
      required final DateTime dateTime,
      required final String userId,
      required final String userName,
      required final String email,
      final String? attachmentUrl}) = _$FeedbackModelImpl;

  factory _FeedbackModel.fromJson(Map<String, dynamic> json) =
      _$FeedbackModelImpl.fromJson;

  @override
  String? get emojiRate;
  @override
  String get feedback;
  @override
  DateTime get dateTime;
  @override
  String get userId;
  @override
  String get userName;
  @override
  String get email;
  @override
  String? get attachmentUrl;

  /// Create a copy of FeedbackModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackModelImplCopyWith<_$FeedbackModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
