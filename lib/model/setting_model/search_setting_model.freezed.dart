// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchSettingModel _$SearchSettingModelFromJson(Map<String, dynamic> json) {
  return _SearchSettingModel.fromJson(json);
}

/// @nodoc
mixin _$SearchSettingModel {
  @JsonKey(name: "search_by_title")
  bool get searchByTitle => throw _privateConstructorUsedError;
  @JsonKey(name: "search_by_body")
  bool get searchByBody => throw _privateConstructorUsedError;

  /// Serializes this SearchSettingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchSettingModelCopyWith<SearchSettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSettingModelCopyWith<$Res> {
  factory $SearchSettingModelCopyWith(
          SearchSettingModel value, $Res Function(SearchSettingModel) then) =
      _$SearchSettingModelCopyWithImpl<$Res, SearchSettingModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "search_by_title") bool searchByTitle,
      @JsonKey(name: "search_by_body") bool searchByBody});
}

/// @nodoc
class _$SearchSettingModelCopyWithImpl<$Res, $Val extends SearchSettingModel>
    implements $SearchSettingModelCopyWith<$Res> {
  _$SearchSettingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchByTitle = null,
    Object? searchByBody = null,
  }) {
    return _then(_value.copyWith(
      searchByTitle: null == searchByTitle
          ? _value.searchByTitle
          : searchByTitle // ignore: cast_nullable_to_non_nullable
              as bool,
      searchByBody: null == searchByBody
          ? _value.searchByBody
          : searchByBody // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchSettingModelImplCopyWith<$Res>
    implements $SearchSettingModelCopyWith<$Res> {
  factory _$$SearchSettingModelImplCopyWith(_$SearchSettingModelImpl value,
          $Res Function(_$SearchSettingModelImpl) then) =
      __$$SearchSettingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "search_by_title") bool searchByTitle,
      @JsonKey(name: "search_by_body") bool searchByBody});
}

/// @nodoc
class __$$SearchSettingModelImplCopyWithImpl<$Res>
    extends _$SearchSettingModelCopyWithImpl<$Res, _$SearchSettingModelImpl>
    implements _$$SearchSettingModelImplCopyWith<$Res> {
  __$$SearchSettingModelImplCopyWithImpl(_$SearchSettingModelImpl _value,
      $Res Function(_$SearchSettingModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchByTitle = null,
    Object? searchByBody = null,
  }) {
    return _then(_$SearchSettingModelImpl(
      searchByTitle: null == searchByTitle
          ? _value.searchByTitle
          : searchByTitle // ignore: cast_nullable_to_non_nullable
              as bool,
      searchByBody: null == searchByBody
          ? _value.searchByBody
          : searchByBody // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchSettingModelImpl extends _SearchSettingModel {
  const _$SearchSettingModelImpl(
      {@JsonKey(name: "search_by_title") this.searchByTitle = true,
      @JsonKey(name: "search_by_body") this.searchByBody = false})
      : super._();

  factory _$SearchSettingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchSettingModelImplFromJson(json);

  @override
  @JsonKey(name: "search_by_title")
  final bool searchByTitle;
  @override
  @JsonKey(name: "search_by_body")
  final bool searchByBody;

  @override
  String toString() {
    return 'SearchSettingModel(searchByTitle: $searchByTitle, searchByBody: $searchByBody)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSettingModelImpl &&
            (identical(other.searchByTitle, searchByTitle) ||
                other.searchByTitle == searchByTitle) &&
            (identical(other.searchByBody, searchByBody) ||
                other.searchByBody == searchByBody));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, searchByTitle, searchByBody);

  /// Create a copy of SearchSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSettingModelImplCopyWith<_$SearchSettingModelImpl> get copyWith =>
      __$$SearchSettingModelImplCopyWithImpl<_$SearchSettingModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchSettingModelImplToJson(
      this,
    );
  }
}

abstract class _SearchSettingModel extends SearchSettingModel {
  const factory _SearchSettingModel(
          {@JsonKey(name: "search_by_title") final bool searchByTitle,
          @JsonKey(name: "search_by_body") final bool searchByBody}) =
      _$SearchSettingModelImpl;
  const _SearchSettingModel._() : super._();

  factory _SearchSettingModel.fromJson(Map<String, dynamic> json) =
      _$SearchSettingModelImpl.fromJson;

  @override
  @JsonKey(name: "search_by_title")
  bool get searchByTitle;
  @override
  @JsonKey(name: "search_by_body")
  bool get searchByBody;

  /// Create a copy of SearchSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchSettingModelImplCopyWith<_$SearchSettingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
