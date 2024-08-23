import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/product_model.dart';
import '../datasource/remote_product_datasource.dart';

part 'product_repository.g.dart';

class ProductRepository {
  RemoteProductDatasource remoteProductDatasource;
  ProductRepository(this.remoteProductDatasource);

  Future<List<Product>> getProducts({CancelToken? cancelToken}) async {
    return remoteProductDatasource.getProducts(cancelToken: cancelToken);
  }

  Future<List<Product>> getProductsByCategory({
    CancelToken? cancelToken,
    required String category,
  }) async {
    return remoteProductDatasource.getProductsByCategory(
      category: category,
      cancelToken: cancelToken,
    );
  }

  Future<List<String>> getCategories({CancelToken? cancelToken}) async {
    return remoteProductDatasource.getCategories(cancelToken: cancelToken);
  }
}

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepository(ref.read(remoteProductDatasourceProvider));
}
