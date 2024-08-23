// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_handler.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResultHandler<Data, Error> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Data data) success,
    required TResult Function(Error error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Data data)? success,
    TResult? Function(Error error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Data data)? success,
    TResult Function(Error error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success<Data, Error> value) success,
    required TResult Function(_Failure<Data, Error> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Success<Data, Error> value)? success,
    TResult? Function(_Failure<Data, Error> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success<Data, Error> value)? success,
    TResult Function(_Failure<Data, Error> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultHandlerCopyWith<Data, Error, $Res> {
  factory $ResultHandlerCopyWith(ResultHandler<Data, Error> value,
          $Res Function(ResultHandler<Data, Error>) then) =
      _$ResultHandlerCopyWithImpl<Data, Error, $Res,
          ResultHandler<Data, Error>>;
}

/// @nodoc
class _$ResultHandlerCopyWithImpl<Data, Error, $Res,
        $Val extends ResultHandler<Data, Error>>
    implements $ResultHandlerCopyWith<Data, Error, $Res> {
  _$ResultHandlerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultHandler
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<Data, Error, $Res> {
  factory _$$SuccessImplCopyWith(_$SuccessImpl<Data, Error> value,
          $Res Function(_$SuccessImpl<Data, Error>) then) =
      __$$SuccessImplCopyWithImpl<Data, Error, $Res>;
  @useResult
  $Res call({Data data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<Data, Error, $Res>
    extends _$ResultHandlerCopyWithImpl<Data, Error, $Res,
        _$SuccessImpl<Data, Error>>
    implements _$$SuccessImplCopyWith<Data, Error, $Res> {
  __$$SuccessImplCopyWithImpl(_$SuccessImpl<Data, Error> _value,
      $Res Function(_$SuccessImpl<Data, Error>) _then)
      : super(_value, _then);

  /// Create a copy of ResultHandler
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessImpl<Data, Error>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<Data, Error> implements _Success<Data, Error> {
  const _$SuccessImpl({required this.data});

  @override
  final Data data;

  @override
  String toString() {
    return 'ResultHandler<$Data, $Error>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<Data, Error> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of ResultHandler
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<Data, Error, _$SuccessImpl<Data, Error>>
      get copyWith =>
          __$$SuccessImplCopyWithImpl<Data, Error, _$SuccessImpl<Data, Error>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Data data) success,
    required TResult Function(Error error) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Data data)? success,
    TResult? Function(Error error)? failure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Data data)? success,
    TResult Function(Error error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success<Data, Error> value) success,
    required TResult Function(_Failure<Data, Error> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Success<Data, Error> value)? success,
    TResult? Function(_Failure<Data, Error> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success<Data, Error> value)? success,
    TResult Function(_Failure<Data, Error> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success<Data, Error> implements ResultHandler<Data, Error> {
  const factory _Success({required final Data data}) =
      _$SuccessImpl<Data, Error>;

  Data get data;

  /// Create a copy of ResultHandler
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<Data, Error, _$SuccessImpl<Data, Error>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<Data, Error, $Res> {
  factory _$$FailureImplCopyWith(_$FailureImpl<Data, Error> value,
          $Res Function(_$FailureImpl<Data, Error>) then) =
      __$$FailureImplCopyWithImpl<Data, Error, $Res>;
  @useResult
  $Res call({Error error});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<Data, Error, $Res>
    extends _$ResultHandlerCopyWithImpl<Data, Error, $Res,
        _$FailureImpl<Data, Error>>
    implements _$$FailureImplCopyWith<Data, Error, $Res> {
  __$$FailureImplCopyWithImpl(_$FailureImpl<Data, Error> _value,
      $Res Function(_$FailureImpl<Data, Error>) _then)
      : super(_value, _then);

  /// Create a copy of ResultHandler
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$FailureImpl<Data, Error>(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error,
    ));
  }
}

/// @nodoc

class _$FailureImpl<Data, Error> implements _Failure<Data, Error> {
  const _$FailureImpl({required this.error});

  @override
  final Error error;

  @override
  String toString() {
    return 'ResultHandler<$Data, $Error>.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl<Data, Error> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of ResultHandler
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<Data, Error, _$FailureImpl<Data, Error>>
      get copyWith =>
          __$$FailureImplCopyWithImpl<Data, Error, _$FailureImpl<Data, Error>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Data data) success,
    required TResult Function(Error error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Data data)? success,
    TResult? Function(Error error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Data data)? success,
    TResult Function(Error error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success<Data, Error> value) success,
    required TResult Function(_Failure<Data, Error> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Success<Data, Error> value)? success,
    TResult? Function(_Failure<Data, Error> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success<Data, Error> value)? success,
    TResult Function(_Failure<Data, Error> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure<Data, Error> implements ResultHandler<Data, Error> {
  const factory _Failure({required final Error error}) =
      _$FailureImpl<Data, Error>;

  Error get error;

  /// Create a copy of ResultHandler
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<Data, Error, _$FailureImpl<Data, Error>>
      get copyWith => throw _privateConstructorUsedError;
}
