// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  int? get authorid => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  DateTime get createdat => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  bool get published => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get updatedat => throw _privateConstructorUsedError;
  int get viewcount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {int? authorid,
      String? content,
      DateTime createdat,
      int? id,
      bool published,
      String title,
      DateTime updatedat,
      int viewcount});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorid = freezed,
    Object? content = freezed,
    Object? createdat = null,
    Object? id = freezed,
    Object? published = null,
    Object? title = null,
    Object? updatedat = null,
    Object? viewcount = null,
  }) {
    return _then(_value.copyWith(
      authorid: freezed == authorid
          ? _value.authorid
          : authorid // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdat: null == createdat
          ? _value.createdat
          : createdat // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      published: null == published
          ? _value.published
          : published // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      updatedat: null == updatedat
          ? _value.updatedat
          : updatedat // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewcount: null == viewcount
          ? _value.viewcount
          : viewcount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? authorid,
      String? content,
      DateTime createdat,
      int? id,
      bool published,
      String title,
      DateTime updatedat,
      int viewcount});
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorid = freezed,
    Object? content = freezed,
    Object? createdat = null,
    Object? id = freezed,
    Object? published = null,
    Object? title = null,
    Object? updatedat = null,
    Object? viewcount = null,
  }) {
    return _then(_$PostImpl(
      authorid: freezed == authorid
          ? _value.authorid
          : authorid // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdat: null == createdat
          ? _value.createdat
          : createdat // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      published: null == published
          ? _value.published
          : published // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      updatedat: null == updatedat
          ? _value.updatedat
          : updatedat // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewcount: null == viewcount
          ? _value.viewcount
          : viewcount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl(
      {this.authorid,
      this.content,
      required this.createdat,
      this.id,
      required this.published,
      required this.title,
      required this.updatedat,
      required this.viewcount});

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  final int? authorid;
  @override
  final String? content;
  @override
  final DateTime createdat;
  @override
  final int? id;
  @override
  final bool published;
  @override
  final String title;
  @override
  final DateTime updatedat;
  @override
  final int viewcount;

  @override
  String toString() {
    return 'Post(authorid: $authorid, content: $content, createdat: $createdat, id: $id, published: $published, title: $title, updatedat: $updatedat, viewcount: $viewcount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.authorid, authorid) ||
                other.authorid == authorid) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdat, createdat) ||
                other.createdat == createdat) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.published, published) ||
                other.published == published) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.updatedat, updatedat) ||
                other.updatedat == updatedat) &&
            (identical(other.viewcount, viewcount) ||
                other.viewcount == viewcount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, authorid, content, createdat, id,
      published, title, updatedat, viewcount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {final int? authorid,
      final String? content,
      required final DateTime createdat,
      final int? id,
      required final bool published,
      required final String title,
      required final DateTime updatedat,
      required final int viewcount}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  int? get authorid;
  @override
  String? get content;
  @override
  DateTime get createdat;
  @override
  int? get id;
  @override
  bool get published;
  @override
  String get title;
  @override
  DateTime get updatedat;
  @override
  int get viewcount;
  @override
  @JsonKey(ignore: true)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
