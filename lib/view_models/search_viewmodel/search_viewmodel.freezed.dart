// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchViewmodelState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchLoading,
    required TResult Function(List<TaskModel> searchedTasks) searchCompleted,
    required TResult Function(String message) searchFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchLoading,
    TResult? Function(List<TaskModel> searchedTasks)? searchCompleted,
    TResult? Function(String message)? searchFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchLoading,
    TResult Function(List<TaskModel> searchedTasks)? searchCompleted,
    TResult Function(String message)? searchFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SearchLoading value) searchLoading,
    required TResult Function(_SearchCompleted value) searchCompleted,
    required TResult Function(_SearchFailed value) searchFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SearchLoading value)? searchLoading,
    TResult? Function(_SearchCompleted value)? searchCompleted,
    TResult? Function(_SearchFailed value)? searchFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SearchLoading value)? searchLoading,
    TResult Function(_SearchCompleted value)? searchCompleted,
    TResult Function(_SearchFailed value)? searchFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchViewmodelStateCopyWith<$Res> {
  factory $SearchViewmodelStateCopyWith(SearchViewmodelState value,
          $Res Function(SearchViewmodelState) then) =
      _$SearchViewmodelStateCopyWithImpl<$Res, SearchViewmodelState>;
}

/// @nodoc
class _$SearchViewmodelStateCopyWithImpl<$Res,
        $Val extends SearchViewmodelState>
    implements $SearchViewmodelStateCopyWith<$Res> {
  _$SearchViewmodelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchViewmodelState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SearchViewmodelStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchViewmodelState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SearchViewmodelState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchLoading,
    required TResult Function(List<TaskModel> searchedTasks) searchCompleted,
    required TResult Function(String message) searchFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchLoading,
    TResult? Function(List<TaskModel> searchedTasks)? searchCompleted,
    TResult? Function(String message)? searchFailed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchLoading,
    TResult Function(List<TaskModel> searchedTasks)? searchCompleted,
    TResult Function(String message)? searchFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SearchLoading value) searchLoading,
    required TResult Function(_SearchCompleted value) searchCompleted,
    required TResult Function(_SearchFailed value) searchFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SearchLoading value)? searchLoading,
    TResult? Function(_SearchCompleted value)? searchCompleted,
    TResult? Function(_SearchFailed value)? searchFailed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SearchLoading value)? searchLoading,
    TResult Function(_SearchCompleted value)? searchCompleted,
    TResult Function(_SearchFailed value)? searchFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SearchViewmodelState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SearchLoadingImplCopyWith<$Res> {
  factory _$$SearchLoadingImplCopyWith(
          _$SearchLoadingImpl value, $Res Function(_$SearchLoadingImpl) then) =
      __$$SearchLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchLoadingImplCopyWithImpl<$Res>
    extends _$SearchViewmodelStateCopyWithImpl<$Res, _$SearchLoadingImpl>
    implements _$$SearchLoadingImplCopyWith<$Res> {
  __$$SearchLoadingImplCopyWithImpl(
      _$SearchLoadingImpl _value, $Res Function(_$SearchLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchViewmodelState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SearchLoadingImpl implements _SearchLoading {
  const _$SearchLoadingImpl();

  @override
  String toString() {
    return 'SearchViewmodelState.searchLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchLoading,
    required TResult Function(List<TaskModel> searchedTasks) searchCompleted,
    required TResult Function(String message) searchFailed,
  }) {
    return searchLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchLoading,
    TResult? Function(List<TaskModel> searchedTasks)? searchCompleted,
    TResult? Function(String message)? searchFailed,
  }) {
    return searchLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchLoading,
    TResult Function(List<TaskModel> searchedTasks)? searchCompleted,
    TResult Function(String message)? searchFailed,
    required TResult orElse(),
  }) {
    if (searchLoading != null) {
      return searchLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SearchLoading value) searchLoading,
    required TResult Function(_SearchCompleted value) searchCompleted,
    required TResult Function(_SearchFailed value) searchFailed,
  }) {
    return searchLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SearchLoading value)? searchLoading,
    TResult? Function(_SearchCompleted value)? searchCompleted,
    TResult? Function(_SearchFailed value)? searchFailed,
  }) {
    return searchLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SearchLoading value)? searchLoading,
    TResult Function(_SearchCompleted value)? searchCompleted,
    TResult Function(_SearchFailed value)? searchFailed,
    required TResult orElse(),
  }) {
    if (searchLoading != null) {
      return searchLoading(this);
    }
    return orElse();
  }
}

abstract class _SearchLoading implements SearchViewmodelState {
  const factory _SearchLoading() = _$SearchLoadingImpl;
}

/// @nodoc
abstract class _$$SearchCompletedImplCopyWith<$Res> {
  factory _$$SearchCompletedImplCopyWith(_$SearchCompletedImpl value,
          $Res Function(_$SearchCompletedImpl) then) =
      __$$SearchCompletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TaskModel> searchedTasks});
}

/// @nodoc
class __$$SearchCompletedImplCopyWithImpl<$Res>
    extends _$SearchViewmodelStateCopyWithImpl<$Res, _$SearchCompletedImpl>
    implements _$$SearchCompletedImplCopyWith<$Res> {
  __$$SearchCompletedImplCopyWithImpl(
      _$SearchCompletedImpl _value, $Res Function(_$SearchCompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchViewmodelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchedTasks = null,
  }) {
    return _then(_$SearchCompletedImpl(
      searchedTasks: null == searchedTasks
          ? _value._searchedTasks
          : searchedTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
    ));
  }
}

/// @nodoc

class _$SearchCompletedImpl implements _SearchCompleted {
  const _$SearchCompletedImpl({required final List<TaskModel> searchedTasks})
      : _searchedTasks = searchedTasks;

  final List<TaskModel> _searchedTasks;
  @override
  List<TaskModel> get searchedTasks {
    if (_searchedTasks is EqualUnmodifiableListView) return _searchedTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedTasks);
  }

  @override
  String toString() {
    return 'SearchViewmodelState.searchCompleted(searchedTasks: $searchedTasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchCompletedImpl &&
            const DeepCollectionEquality()
                .equals(other._searchedTasks, _searchedTasks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_searchedTasks));

  /// Create a copy of SearchViewmodelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchCompletedImplCopyWith<_$SearchCompletedImpl> get copyWith =>
      __$$SearchCompletedImplCopyWithImpl<_$SearchCompletedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchLoading,
    required TResult Function(List<TaskModel> searchedTasks) searchCompleted,
    required TResult Function(String message) searchFailed,
  }) {
    return searchCompleted(searchedTasks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchLoading,
    TResult? Function(List<TaskModel> searchedTasks)? searchCompleted,
    TResult? Function(String message)? searchFailed,
  }) {
    return searchCompleted?.call(searchedTasks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchLoading,
    TResult Function(List<TaskModel> searchedTasks)? searchCompleted,
    TResult Function(String message)? searchFailed,
    required TResult orElse(),
  }) {
    if (searchCompleted != null) {
      return searchCompleted(searchedTasks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SearchLoading value) searchLoading,
    required TResult Function(_SearchCompleted value) searchCompleted,
    required TResult Function(_SearchFailed value) searchFailed,
  }) {
    return searchCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SearchLoading value)? searchLoading,
    TResult? Function(_SearchCompleted value)? searchCompleted,
    TResult? Function(_SearchFailed value)? searchFailed,
  }) {
    return searchCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SearchLoading value)? searchLoading,
    TResult Function(_SearchCompleted value)? searchCompleted,
    TResult Function(_SearchFailed value)? searchFailed,
    required TResult orElse(),
  }) {
    if (searchCompleted != null) {
      return searchCompleted(this);
    }
    return orElse();
  }
}

abstract class _SearchCompleted implements SearchViewmodelState {
  const factory _SearchCompleted(
      {required final List<TaskModel> searchedTasks}) = _$SearchCompletedImpl;

  List<TaskModel> get searchedTasks;

  /// Create a copy of SearchViewmodelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchCompletedImplCopyWith<_$SearchCompletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchFailedImplCopyWith<$Res> {
  factory _$$SearchFailedImplCopyWith(
          _$SearchFailedImpl value, $Res Function(_$SearchFailedImpl) then) =
      __$$SearchFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SearchFailedImplCopyWithImpl<$Res>
    extends _$SearchViewmodelStateCopyWithImpl<$Res, _$SearchFailedImpl>
    implements _$$SearchFailedImplCopyWith<$Res> {
  __$$SearchFailedImplCopyWithImpl(
      _$SearchFailedImpl _value, $Res Function(_$SearchFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchViewmodelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SearchFailedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchFailedImpl implements _SearchFailed {
  const _$SearchFailedImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'SearchViewmodelState.searchFailed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchFailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SearchViewmodelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchFailedImplCopyWith<_$SearchFailedImpl> get copyWith =>
      __$$SearchFailedImplCopyWithImpl<_$SearchFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchLoading,
    required TResult Function(List<TaskModel> searchedTasks) searchCompleted,
    required TResult Function(String message) searchFailed,
  }) {
    return searchFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchLoading,
    TResult? Function(List<TaskModel> searchedTasks)? searchCompleted,
    TResult? Function(String message)? searchFailed,
  }) {
    return searchFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchLoading,
    TResult Function(List<TaskModel> searchedTasks)? searchCompleted,
    TResult Function(String message)? searchFailed,
    required TResult orElse(),
  }) {
    if (searchFailed != null) {
      return searchFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SearchLoading value) searchLoading,
    required TResult Function(_SearchCompleted value) searchCompleted,
    required TResult Function(_SearchFailed value) searchFailed,
  }) {
    return searchFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SearchLoading value)? searchLoading,
    TResult? Function(_SearchCompleted value)? searchCompleted,
    TResult? Function(_SearchFailed value)? searchFailed,
  }) {
    return searchFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SearchLoading value)? searchLoading,
    TResult Function(_SearchCompleted value)? searchCompleted,
    TResult Function(_SearchFailed value)? searchFailed,
    required TResult orElse(),
  }) {
    if (searchFailed != null) {
      return searchFailed(this);
    }
    return orElse();
  }
}

abstract class _SearchFailed implements SearchViewmodelState {
  const factory _SearchFailed({required final String message}) =
      _$SearchFailedImpl;

  String get message;

  /// Create a copy of SearchViewmodelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchFailedImplCopyWith<_$SearchFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
