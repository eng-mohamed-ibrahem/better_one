// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_viewmodel_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuoteViewmodelState {
  bool get isInitial => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  QuoteModel? get quote => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuoteViewmodelStateCopyWith<QuoteViewmodelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteViewmodelStateCopyWith<$Res> {
  factory $QuoteViewmodelStateCopyWith(
          QuoteViewmodelState value, $Res Function(QuoteViewmodelState) then) =
      _$QuoteViewmodelStateCopyWithImpl<$Res, QuoteViewmodelState>;
  @useResult
  $Res call(
      {bool isInitial,
      bool isLoading,
      bool isCompleted,
      QuoteModel? quote,
      bool isFailed,
      String? errorMessage});

  $QuoteModelCopyWith<$Res>? get quote;
}

/// @nodoc
class _$QuoteViewmodelStateCopyWithImpl<$Res, $Val extends QuoteViewmodelState>
    implements $QuoteViewmodelStateCopyWith<$Res> {
  _$QuoteViewmodelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitial = null,
    Object? isLoading = null,
    Object? isCompleted = null,
    Object? quote = freezed,
    Object? isFailed = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      quote: freezed == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as QuoteModel?,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuoteModelCopyWith<$Res>? get quote {
    if (_value.quote == null) {
      return null;
    }

    return $QuoteModelCopyWith<$Res>(_value.quote!, (value) {
      return _then(_value.copyWith(quote: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuoteViewmodelStateImplCopyWith<$Res>
    implements $QuoteViewmodelStateCopyWith<$Res> {
  factory _$$QuoteViewmodelStateImplCopyWith(_$QuoteViewmodelStateImpl value,
          $Res Function(_$QuoteViewmodelStateImpl) then) =
      __$$QuoteViewmodelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isInitial,
      bool isLoading,
      bool isCompleted,
      QuoteModel? quote,
      bool isFailed,
      String? errorMessage});

  @override
  $QuoteModelCopyWith<$Res>? get quote;
}

/// @nodoc
class __$$QuoteViewmodelStateImplCopyWithImpl<$Res>
    extends _$QuoteViewmodelStateCopyWithImpl<$Res, _$QuoteViewmodelStateImpl>
    implements _$$QuoteViewmodelStateImplCopyWith<$Res> {
  __$$QuoteViewmodelStateImplCopyWithImpl(_$QuoteViewmodelStateImpl _value,
      $Res Function(_$QuoteViewmodelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitial = null,
    Object? isLoading = null,
    Object? isCompleted = null,
    Object? quote = freezed,
    Object? isFailed = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$QuoteViewmodelStateImpl(
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      quote: freezed == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as QuoteModel?,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$QuoteViewmodelStateImpl implements _QuoteViewmodelState {
  const _$QuoteViewmodelStateImpl(
      {this.isInitial = true,
      this.isLoading = false,
      this.isCompleted = false,
      this.quote = null,
      this.isFailed = false,
      this.errorMessage = null});

  @override
  @JsonKey()
  final bool isInitial;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  @JsonKey()
  final QuoteModel? quote;
  @override
  @JsonKey()
  final bool isFailed;
  @override
  @JsonKey()
  final String? errorMessage;

  @override
  String toString() {
    return 'QuoteViewmodelState(isInitial: $isInitial, isLoading: $isLoading, isCompleted: $isCompleted, quote: $quote, isFailed: $isFailed, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuoteViewmodelStateImpl &&
            (identical(other.isInitial, isInitial) ||
                other.isInitial == isInitial) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.quote, quote) || other.quote == quote) &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isInitial, isLoading,
      isCompleted, quote, isFailed, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuoteViewmodelStateImplCopyWith<_$QuoteViewmodelStateImpl> get copyWith =>
      __$$QuoteViewmodelStateImplCopyWithImpl<_$QuoteViewmodelStateImpl>(
          this, _$identity);
}

abstract class _QuoteViewmodelState implements QuoteViewmodelState {
  const factory _QuoteViewmodelState(
      {final bool isInitial,
      final bool isLoading,
      final bool isCompleted,
      final QuoteModel? quote,
      final bool isFailed,
      final String? errorMessage}) = _$QuoteViewmodelStateImpl;

  @override
  bool get isInitial;
  @override
  bool get isLoading;
  @override
  bool get isCompleted;
  @override
  QuoteModel? get quote;
  @override
  bool get isFailed;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$QuoteViewmodelStateImplCopyWith<_$QuoteViewmodelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
