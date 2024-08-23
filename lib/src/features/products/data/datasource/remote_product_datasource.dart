import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../services/api_client.dart';
import '../../../../utils/exception_handler.dart';
import '../../domain/category_model.dart';
import '../../domain/product_model.dart';

part 'remote_product_datasource.g.dart';

class RemoteProductDatasource {
  final ApiClient apiClient;
  RemoteProductDatasource({required this.apiClient});

  Future<List<Product>> getProducts({CancelToken? cancelToken}) async {
    return handleException<List<Product>>(() async {
      final response = await apiClient.httpClient.get(
        '/products?limit=0', // limit=0 to get all items.
        cancelToken: cancelToken,
      );

      return (response.data['products'] as List).map<Product>((e) => Product.fromJson(e)).toList();
    });
  }

  Future<List<Product>> getProductsByCategory({
    CancelToken? cancelToken,
    required String category,
  }) async {
    return handleException<List<Product>>(() async {
      final response = await apiClient.httpClient.get(
        '/products/category/$category?limit=0', // limit=0 to get all items.
        cancelToken: cancelToken,
      );

      return (response.data['products'] as List).map<Product>((e) => Product.fromJson(e)).toList();
    });
  }

  Future<Product> getProductById({CancelToken? cancelToken, required int id}) async {
    return handleException<Product>(() async {
      final response = await apiClient.httpClient.get(
        '/products/$id',
        cancelToken: cancelToken,
      );

      return Product.fromJson(response.data);
    });
  }

  Future<List<Category>> getCategories({CancelToken? cancelToken}) async {
    return handleException<List<Category>>(() async {
      final response = await apiClient.httpClient.get(
        '/products/categories',
        cancelToken: cancelToken,
      );

      return (response.data as List).map<Category>((e) => Category.fromJson(e)).toList();
    });
  }
}

@riverpod
RemoteProductDatasource remoteProductDatasource(RemoteProductDatasourceRef ref) {
  return RemoteProductDatasource(apiClient: ref.read(apiClientProvider));
}
