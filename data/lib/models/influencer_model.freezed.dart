// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'influencer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InfluencerModel _$InfluencerModelFromJson(Map<String, dynamic> json) {
  return _InfluencerModel.fromJson(json);
}

/// @nodoc
mixin _$InfluencerModel {
  @HiveField(0)
  String? get image => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get followers => throw _privateConstructorUsedError;
  @HiveField(3)
  int? get posts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InfluencerModelCopyWith<InfluencerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfluencerModelCopyWith<$Res> {
  factory $InfluencerModelCopyWith(
          InfluencerModel value, $Res Function(InfluencerModel) then) =
      _$InfluencerModelCopyWithImpl<$Res, InfluencerModel>;
  @useResult
  $Res call(
      {@HiveField(0) String? image,
      @HiveField(1) String? name,
      @HiveField(2) String? followers,
      @HiveField(3) int? posts});
}

/// @nodoc
class _$InfluencerModelCopyWithImpl<$Res, $Val extends InfluencerModel>
    implements $InfluencerModelCopyWith<$Res> {
  _$InfluencerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? name = freezed,
    Object? followers = freezed,
    Object? posts = freezed,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      followers: freezed == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as String?,
      posts: freezed == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InfluencerModelCopyWith<$Res>
    implements $InfluencerModelCopyWith<$Res> {
  factory _$$_InfluencerModelCopyWith(
          _$_InfluencerModel value, $Res Function(_$_InfluencerModel) then) =
      __$$_InfluencerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? image,
      @HiveField(1) String? name,
      @HiveField(2) String? followers,
      @HiveField(3) int? posts});
}

/// @nodoc
class __$$_InfluencerModelCopyWithImpl<$Res>
    extends _$InfluencerModelCopyWithImpl<$Res, _$_InfluencerModel>
    implements _$$_InfluencerModelCopyWith<$Res> {
  __$$_InfluencerModelCopyWithImpl(
      _$_InfluencerModel _value, $Res Function(_$_InfluencerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? name = freezed,
    Object? followers = freezed,
    Object? posts = freezed,
  }) {
    return _then(_$_InfluencerModel(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      followers: freezed == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as String?,
      posts: freezed == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_InfluencerModel implements _InfluencerModel {
  _$_InfluencerModel(
      {@HiveField(0) this.image = '',
      @HiveField(1) this.name = '',
      @HiveField(2) this.followers = '',
      @HiveField(3) this.posts = 0});

  factory _$_InfluencerModel.fromJson(Map<String, dynamic> json) =>
      _$$_InfluencerModelFromJson(json);

  @override
  @JsonKey()
  @HiveField(0)
  final String? image;
  @override
  @JsonKey()
  @HiveField(1)
  final String? name;
  @override
  @JsonKey()
  @HiveField(2)
  final String? followers;
  @override
  @JsonKey()
  @HiveField(3)
  final int? posts;

  @override
  String toString() {
    return 'InfluencerModel(image: $image, name: $name, followers: $followers, posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InfluencerModel &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.followers, followers) ||
                other.followers == followers) &&
            (identical(other.posts, posts) || other.posts == posts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, image, name, followers, posts);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InfluencerModelCopyWith<_$_InfluencerModel> get copyWith =>
      __$$_InfluencerModelCopyWithImpl<_$_InfluencerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InfluencerModelToJson(
      this,
    );
  }
}

abstract class _InfluencerModel implements InfluencerModel {
  factory _InfluencerModel(
      {@HiveField(0) final String? image,
      @HiveField(1) final String? name,
      @HiveField(2) final String? followers,
      @HiveField(3) final int? posts}) = _$_InfluencerModel;

  factory _InfluencerModel.fromJson(Map<String, dynamic> json) =
      _$_InfluencerModel.fromJson;

  @override
  @HiveField(0)
  String? get image;
  @override
  @HiveField(1)
  String? get name;
  @override
  @HiveField(2)
  String? get followers;
  @override
  @HiveField(3)
  int? get posts;
  @override
  @JsonKey(ignore: true)
  _$$_InfluencerModelCopyWith<_$_InfluencerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
