import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/extensions.dart';
import '../../data/repositories/product_repository.dart';
import '../../domain/category_model.dart';
import '../../domain/product_model.dart';

part 'products_provider.g.dart';

@riverpod
class Categories extends _$Categories {
  @override
  Future<List<Category>> build() async {
    final categories = await ref.watch(productRepositoryProvider).getCategories();
    // 'All Items' category supposed to be the first item in the list
    // and it should be the default selected category
    categories.insert(0, Category.all());

    return categories;
  }
}

@riverpod
class Products extends _$Products {
  /// Passing [null] will return all products
  @override
  Future<List<Product>> build({Category? category}) {
    ref.cacheOnCanceledFor(const Duration(seconds: 30));
    if (category == null || category == Category.all()) {
      return ref.watch(productRepositoryProvider).getProducts();
    } else {
      return ref.watch(productRepositoryProvider).getProductsByCategory(category: category.name);
    }
  }
}
