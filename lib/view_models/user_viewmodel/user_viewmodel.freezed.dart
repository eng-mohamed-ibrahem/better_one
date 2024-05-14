// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserViewmodelState {
  bool get isInitialized => throw _privateConstructorUsedError;

  /// logout
  bool get isLogoutLoading => throw _privateConstructorUsedError;
  bool get isLogoutSuccess => throw _privateConstructorUsedError;
  bool get isLogoutFailed => throw _privateConstructorUsedError;

  /// user details
  bool get isGetUserDetailsLoading => throw _privateConstructorUsedError;
  bool get isGetUserDetailsSuccess => throw _privateConstructorUsedError;
  bool get isGetUserDetailsFailed => throw _privateConstructorUsedError;

  /// the current user
  UserModel? get user => throw _privateConstructorUsedError;

  /// check activity of user
  bool get isUserActiveLoading => throw _privateConstructorUsedError;
  bool get isUserActiveSuccess => throw _privateConstructorUsedError;
  bool get isUserActiveFailed => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// error
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserViewmodelStateCopyWith<UserViewmodelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserViewmodelStateCopyWith<$Res> {
  factory $UserViewmodelStateCopyWith(
          UserViewmodelState value, $Res Function(UserViewmodelState) then) =
      _$UserViewmodelStateCopyWithImpl<$Res, UserViewmodelState>;
  @useResult
  $Res call(
      {bool isInitialized,
      bool isLogoutLoading,
      bool isLogoutSuccess,
      bool isLogoutFailed,
      bool isGetUserDetailsLoading,
      bool isGetUserDetailsSuccess,
      bool isGetUserDetailsFailed,
      UserModel? user,
      bool isUserActiveLoading,
      bool isUserActiveSuccess,
      bool isUserActiveFailed,
      bool isActive,
      String? errorMessage});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserViewmodelStateCopyWithImpl<$Res, $Val extends UserViewmodelState>
    implements $UserViewmodelStateCopyWith<$Res> {
  _$UserViewmodelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? isLogoutLoading = null,
    Object? isLogoutSuccess = null,
    Object? isLogoutFailed = null,
    Object? isGetUserDetailsLoading = null,
    Object? isGetUserDetailsSuccess = null,
    Object? isGetUserDetailsFailed = null,
    Object? user = freezed,
    Object? isUserActiveLoading = null,
    Object? isUserActiveSuccess = null,
    Object? isUserActiveFailed = null,
    Object? isActive = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutLoading: null == isLogoutLoading
          ? _value.isLogoutLoading
          : isLogoutLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutSuccess: null == isLogoutSuccess
          ? _value.isLogoutSuccess
          : isLogoutSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutFailed: null == isLogoutFailed
          ? _value.isLogoutFailed
          : isLogoutFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetUserDetailsLoading: null == isGetUserDetailsLoading
          ? _value.isGetUserDetailsLoading
          : isGetUserDetailsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetUserDetailsSuccess: null == isGetUserDetailsSuccess
          ? _value.isGetUserDetailsSuccess
          : isGetUserDetailsSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetUserDetailsFailed: null == isGetUserDetailsFailed
          ? _value.isGetUserDetailsFailed
          : isGetUserDetailsFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      isUserActiveLoading: null == isUserActiveLoading
          ? _value.isUserActiveLoading
          : isUserActiveLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserActiveSuccess: null == isUserActiveSuccess
          ? _value.isUserActiveSuccess
          : isUserActiveSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserActiveFailed: null == isUserActiveFailed
          ? _value.isUserActiveFailed
          : isUserActiveFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserViewmodelStateImplCopyWith<$Res>
    implements $UserViewmodelStateCopyWith<$Res> {
  factory _$$UserViewmodelStateImplCopyWith(_$UserViewmodelStateImpl value,
          $Res Function(_$UserViewmodelStateImpl) then) =
      __$$UserViewmodelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isInitialized,
      bool isLogoutLoading,
      bool isLogoutSuccess,
      bool isLogoutFailed,
      bool isGetUserDetailsLoading,
      bool isGetUserDetailsSuccess,
      bool isGetUserDetailsFailed,
      UserModel? user,
      bool isUserActiveLoading,
      bool isUserActiveSuccess,
      bool isUserActiveFailed,
      bool isActive,
      String? errorMessage});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UserViewmodelStateImplCopyWithImpl<$Res>
    extends _$UserViewmodelStateCopyWithImpl<$Res, _$UserViewmodelStateImpl>
    implements _$$UserViewmodelStateImplCopyWith<$Res> {
  __$$UserViewmodelStateImplCopyWithImpl(_$UserViewmodelStateImpl _value,
      $Res Function(_$UserViewmodelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? isLogoutLoading = null,
    Object? isLogoutSuccess = null,
    Object? isLogoutFailed = null,
    Object? isGetUserDetailsLoading = null,
    Object? isGetUserDetailsSuccess = null,
    Object? isGetUserDetailsFailed = null,
    Object? user = freezed,
    Object? isUserActiveLoading = null,
    Object? isUserActiveSuccess = null,
    Object? isUserActiveFailed = null,
    Object? isActive = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$UserViewmodelStateImpl(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutLoading: null == isLogoutLoading
          ? _value.isLogoutLoading
          : isLogoutLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutSuccess: null == isLogoutSuccess
          ? _value.isLogoutSuccess
          : isLogoutSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutFailed: null == isLogoutFailed
          ? _value.isLogoutFailed
          : isLogoutFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetUserDetailsLoading: null == isGetUserDetailsLoading
          ? _value.isGetUserDetailsLoading
          : isGetUserDetailsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetUserDetailsSuccess: null == isGetUserDetailsSuccess
          ? _value.isGetUserDetailsSuccess
          : isGetUserDetailsSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetUserDetailsFailed: null == isGetUserDetailsFailed
          ? _value.isGetUserDetailsFailed
          : isGetUserDetailsFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      isUserActiveLoading: null == isUserActiveLoading
          ? _value.isUserActiveLoading
          : isUserActiveLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserActiveSuccess: null == isUserActiveSuccess
          ? _value.isUserActiveSuccess
          : isUserActiveSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserActiveFailed: null == isUserActiveFailed
          ? _value.isUserActiveFailed
          : isUserActiveFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserViewmodelStateImpl implements _UserViewmodelState {
  const _$UserViewmodelStateImpl(
      {this.isInitialized = true,
      this.isLogoutLoading = false,
      this.isLogoutSuccess = false,
      this.isLogoutFailed = false,
      this.isGetUserDetailsLoading = false,
      this.isGetUserDetailsSuccess = false,
      this.isGetUserDetailsFailed = false,
      this.user = null,
      this.isUserActiveLoading = false,
      this.isUserActiveSuccess = false,
      this.isUserActiveFailed = false,
      this.isActive = false,
      this.errorMessage = null});

  @override
  @JsonKey()
  final bool isInitialized;

  /// logout
  @override
  @JsonKey()
  final bool isLogoutLoading;
  @override
  @JsonKey()
  final bool isLogoutSuccess;
  @override
  @JsonKey()
  final bool isLogoutFailed;

  /// user details
  @override
  @JsonKey()
  final bool isGetUserDetailsLoading;
  @override
  @JsonKey()
  final bool isGetUserDetailsSuccess;
  @override
  @JsonKey()
  final bool isGetUserDetailsFailed;

  /// the current user
  @override
  @JsonKey()
  final UserModel? user;

  /// check activity of user
  @override
  @JsonKey()
  final bool isUserActiveLoading;
  @override
  @JsonKey()
  final bool isUserActiveSuccess;
  @override
  @JsonKey()
  final bool isUserActiveFailed;
  @override
  @JsonKey()
  final bool isActive;

  /// error
  @override
  @JsonKey()
  final String? errorMessage;

  @override
  String toString() {
    return 'UserViewmodelState(isInitialized: $isInitialized, isLogoutLoading: $isLogoutLoading, isLogoutSuccess: $isLogoutSuccess, isLogoutFailed: $isLogoutFailed, isGetUserDetailsLoading: $isGetUserDetailsLoading, isGetUserDetailsSuccess: $isGetUserDetailsSuccess, isGetUserDetailsFailed: $isGetUserDetailsFailed, user: $user, isUserActiveLoading: $isUserActiveLoading, isUserActiveSuccess: $isUserActiveSuccess, isUserActiveFailed: $isUserActiveFailed, isActive: $isActive, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserViewmodelStateImpl &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized) &&
            (identical(other.isLogoutLoading, isLogoutLoading) ||
                other.isLogoutLoading == isLogoutLoading) &&
            (identical(other.isLogoutSuccess, isLogoutSuccess) ||
                other.isLogoutSuccess == isLogoutSuccess) &&
            (identical(other.isLogoutFailed, isLogoutFailed) ||
                other.isLogoutFailed == isLogoutFailed) &&
            (identical(
                    other.isGetUserDetailsLoading, isGetUserDetailsLoading) ||
                other.isGetUserDetailsLoading == isGetUserDetailsLoading) &&
            (identical(
                    other.isGetUserDetailsSuccess, isGetUserDetailsSuccess) ||
                other.isGetUserDetailsSuccess == isGetUserDetailsSuccess) &&
            (identical(other.isGetUserDetailsFailed, isGetUserDetailsFailed) ||
                other.isGetUserDetailsFailed == isGetUserDetailsFailed) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isUserActiveLoading, isUserActiveLoading) ||
                other.isUserActiveLoading == isUserActiveLoading) &&
            (identical(other.isUserActiveSuccess, isUserActiveSuccess) ||
                other.isUserActiveSuccess == isUserActiveSuccess) &&
            (identical(other.isUserActiveFailed, isUserActiveFailed) ||
                other.isUserActiveFailed == isUserActiveFailed) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isInitialized,
      isLogoutLoading,
      isLogoutSuccess,
      isLogoutFailed,
      isGetUserDetailsLoading,
      isGetUserDetailsSuccess,
      isGetUserDetailsFailed,
      user,
      isUserActiveLoading,
      isUserActiveSuccess,
      isUserActiveFailed,
      isActive,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserViewmodelStateImplCopyWith<_$UserViewmodelStateImpl> get copyWith =>
      __$$UserViewmodelStateImplCopyWithImpl<_$UserViewmodelStateImpl>(
          this, _$identity);
}

abstract class _UserViewmodelState implements UserViewmodelState {
  const factory _UserViewmodelState(
      {final bool isInitialized,
      final bool isLogoutLoading,
      final bool isLogoutSuccess,
      final bool isLogoutFailed,
      final bool isGetUserDetailsLoading,
      final bool isGetUserDetailsSuccess,
      final bool isGetUserDetailsFailed,
      final UserModel? user,
      final bool isUserActiveLoading,
      final bool isUserActiveSuccess,
      final bool isUserActiveFailed,
      final bool isActive,
      final String? errorMessage}) = _$UserViewmodelStateImpl;

  @override
  bool get isInitialized;
  @override

  /// logout
  bool get isLogoutLoading;
  @override
  bool get isLogoutSuccess;
  @override
  bool get isLogoutFailed;
  @override

  /// user details
  bool get isGetUserDetailsLoading;
  @override
  bool get isGetUserDetailsSuccess;
  @override
  bool get isGetUserDetailsFailed;
  @override

  /// the current user
  UserModel? get user;
  @override

  /// check activity of user
  bool get isUserActiveLoading;
  @override
  bool get isUserActiveSuccess;
  @override
  bool get isUserActiveFailed;
  @override
  bool get isActive;
  @override

  /// error
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$UserViewmodelStateImplCopyWith<_$UserViewmodelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
