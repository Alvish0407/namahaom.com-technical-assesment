import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/extensions.dart';
import '../../data/repositories/product_repository.dart';
import '../../domain/product_model.dart';

part 'product_details_provider.g.dart';

@riverpod
class ProductDetails extends _$ProductDetails {
  @override
  Future<Product> build({required String id}) {
    ref.cacheFor(const Duration(minutes: 1));
    return ref.watch(productRepositoryProvider).getProductById(id: id);
  }
}
