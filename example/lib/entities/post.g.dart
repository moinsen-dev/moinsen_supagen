// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      authorid: json['authorid'] as int?,
      content: json['content'] as String?,
      createdat: DateTime.parse(json['createdat'] as String),
      id: json['id'] as int?,
      published: json['published'] as bool,
      title: json['title'] as String,
      updatedat: DateTime.parse(json['updatedat'] as String),
      viewcount: json['viewcount'] as int,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'authorid': instance.authorid,
      'content': instance.content,
      'createdat': instance.createdat.toIso8601String(),
      'id': instance.id,
      'published': instance.published,
      'title': instance.title,
      'updatedat': instance.updatedat.toIso8601String(),
      'viewcount': instance.viewcount,
    };
