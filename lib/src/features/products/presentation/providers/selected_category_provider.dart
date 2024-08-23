import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/category_model.dart';

part 'selected_category_provider.g.dart';

@riverpod
class SelectedCategory extends _$SelectedCategory {
  @override
  Category build() {
    return Category.all();
  }

  set set(Category category) {
    state = category;
  }
}
