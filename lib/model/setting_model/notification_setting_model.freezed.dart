// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationSettingModel _$NotificationSettingModelFromJson(
    Map<String, dynamic> json) {
  return _NotificationSettingModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationSettingModel {
  @JsonKey(name: "send_on_add")
  bool get sendOnAdd => throw _privateConstructorUsedError;
  @JsonKey(name: "send_on_update")
  bool get sendOnUpdate => throw _privateConstructorUsedError;
  @JsonKey(name: "send_on_complete")
  bool get sendOnComplete => throw _privateConstructorUsedError;
  @JsonKey(name: "mute_notification")
  bool get muteNotification => throw _privateConstructorUsedError;

  /// Serializes this NotificationSettingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationSettingModelCopyWith<NotificationSettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingModelCopyWith<$Res> {
  factory $NotificationSettingModelCopyWith(NotificationSettingModel value,
          $Res Function(NotificationSettingModel) then) =
      _$NotificationSettingModelCopyWithImpl<$Res, NotificationSettingModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "send_on_add") bool sendOnAdd,
      @JsonKey(name: "send_on_update") bool sendOnUpdate,
      @JsonKey(name: "send_on_complete") bool sendOnComplete,
      @JsonKey(name: "mute_notification") bool muteNotification});
}

/// @nodoc
class _$NotificationSettingModelCopyWithImpl<$Res,
        $Val extends NotificationSettingModel>
    implements $NotificationSettingModelCopyWith<$Res> {
  _$NotificationSettingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendOnAdd = null,
    Object? sendOnUpdate = null,
    Object? sendOnComplete = null,
    Object? muteNotification = null,
  }) {
    return _then(_value.copyWith(
      sendOnAdd: null == sendOnAdd
          ? _value.sendOnAdd
          : sendOnAdd // ignore: cast_nullable_to_non_nullable
              as bool,
      sendOnUpdate: null == sendOnUpdate
          ? _value.sendOnUpdate
          : sendOnUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      sendOnComplete: null == sendOnComplete
          ? _value.sendOnComplete
          : sendOnComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      muteNotification: null == muteNotification
          ? _value.muteNotification
          : muteNotification // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationSettingModelImplCopyWith<$Res>
    implements $NotificationSettingModelCopyWith<$Res> {
  factory _$$NotificationSettingModelImplCopyWith(
          _$NotificationSettingModelImpl value,
          $Res Function(_$NotificationSettingModelImpl) then) =
      __$$NotificationSettingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "send_on_add") bool sendOnAdd,
      @JsonKey(name: "send_on_update") bool sendOnUpdate,
      @JsonKey(name: "send_on_complete") bool sendOnComplete,
      @JsonKey(name: "mute_notification") bool muteNotification});
}

/// @nodoc
class __$$NotificationSettingModelImplCopyWithImpl<$Res>
    extends _$NotificationSettingModelCopyWithImpl<$Res,
        _$NotificationSettingModelImpl>
    implements _$$NotificationSettingModelImplCopyWith<$Res> {
  __$$NotificationSettingModelImplCopyWithImpl(
      _$NotificationSettingModelImpl _value,
      $Res Function(_$NotificationSettingModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendOnAdd = null,
    Object? sendOnUpdate = null,
    Object? sendOnComplete = null,
    Object? muteNotification = null,
  }) {
    return _then(_$NotificationSettingModelImpl(
      sendOnAdd: null == sendOnAdd
          ? _value.sendOnAdd
          : sendOnAdd // ignore: cast_nullable_to_non_nullable
              as bool,
      sendOnUpdate: null == sendOnUpdate
          ? _value.sendOnUpdate
          : sendOnUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      sendOnComplete: null == sendOnComplete
          ? _value.sendOnComplete
          : sendOnComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      muteNotification: null == muteNotification
          ? _value.muteNotification
          : muteNotification // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSettingModelImpl extends _NotificationSettingModel {
  const _$NotificationSettingModelImpl(
      {@JsonKey(name: "send_on_add") this.sendOnAdd = true,
      @JsonKey(name: "send_on_update") this.sendOnUpdate = true,
      @JsonKey(name: "send_on_complete") this.sendOnComplete = true,
      @JsonKey(name: "mute_notification") this.muteNotification = false})
      : super._();

  factory _$NotificationSettingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSettingModelImplFromJson(json);

  @override
  @JsonKey(name: "send_on_add")
  final bool sendOnAdd;
  @override
  @JsonKey(name: "send_on_update")
  final bool sendOnUpdate;
  @override
  @JsonKey(name: "send_on_complete")
  final bool sendOnComplete;
  @override
  @JsonKey(name: "mute_notification")
  final bool muteNotification;

  @override
  String toString() {
    return 'NotificationSettingModel(sendOnAdd: $sendOnAdd, sendOnUpdate: $sendOnUpdate, sendOnComplete: $sendOnComplete, muteNotification: $muteNotification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingModelImpl &&
            (identical(other.sendOnAdd, sendOnAdd) ||
                other.sendOnAdd == sendOnAdd) &&
            (identical(other.sendOnUpdate, sendOnUpdate) ||
                other.sendOnUpdate == sendOnUpdate) &&
            (identical(other.sendOnComplete, sendOnComplete) ||
                other.sendOnComplete == sendOnComplete) &&
            (identical(other.muteNotification, muteNotification) ||
                other.muteNotification == muteNotification));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, sendOnAdd, sendOnUpdate, sendOnComplete, muteNotification);

  /// Create a copy of NotificationSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSettingModelImplCopyWith<_$NotificationSettingModelImpl>
      get copyWith => __$$NotificationSettingModelImplCopyWithImpl<
          _$NotificationSettingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSettingModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationSettingModel extends NotificationSettingModel {
  const factory _NotificationSettingModel(
          {@JsonKey(name: "send_on_add") final bool sendOnAdd,
          @JsonKey(name: "send_on_update") final bool sendOnUpdate,
          @JsonKey(name: "send_on_complete") final bool sendOnComplete,
          @JsonKey(name: "mute_notification") final bool muteNotification}) =
      _$NotificationSettingModelImpl;
  const _NotificationSettingModel._() : super._();

  factory _NotificationSettingModel.fromJson(Map<String, dynamic> json) =
      _$NotificationSettingModelImpl.fromJson;

  @override
  @JsonKey(name: "send_on_add")
  bool get sendOnAdd;
  @override
  @JsonKey(name: "send_on_update")
  bool get sendOnUpdate;
  @override
  @JsonKey(name: "send_on_complete")
  bool get sendOnComplete;
  @override
  @JsonKey(name: "mute_notification")
  bool get muteNotification;

  /// Create a copy of NotificationSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationSettingModelImplCopyWith<_$NotificationSettingModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
