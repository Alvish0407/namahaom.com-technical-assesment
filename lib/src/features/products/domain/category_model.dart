import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required String url,
    required String slug,
    required String name,
  }) = _Category;

  factory Category.fromJson(Map<String, Object?> json) => _$CategoryFromJson(json);

  // This factory represents the 'All' category.
  factory Category.all() => const Category(url: '', slug: '', name: 'All');
}
