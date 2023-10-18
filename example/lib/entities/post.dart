import 'package:freezed_annotation/freezed_annotation.dart';
part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    int? authorid,
    String? content,
    required DateTime createdat,
    int? id,
    required bool published,
    required String title,
    required DateTime updatedat,
    required int viewcount,
  }) = _Post;

  factory Post.fromJson(Map<String, Object?> json) => _$PostFromJson(json);
}
