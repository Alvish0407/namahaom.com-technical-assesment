import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../services/api_client.dart';
import '../../../../utils/exception_handler.dart';
import '../../domain/product_model.dart';

part 'remote_product_datasource.g.dart';

class RemoteProductDatasource {
  final ApiClient apiClient;
  RemoteProductDatasource({required this.apiClient});

  Future<List<Product>> getProducts({CancelToken? cancelToken}) async {
    return handleException<List<Product>>(() async {
      final response = await apiClient.httpClient.get(
        '/products',
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
        '/products/category/$category',
        cancelToken: cancelToken,
      );

      return (response.data['products'] as List).map<Product>((e) => Product.fromJson(e)).toList();
    });
  }

  Future<List<String>> getCategories({CancelToken? cancelToken}) async {
    return handleException<List<String>>(() async {
      final response = await apiClient.httpClient.get(
        '/products/category-list',
        cancelToken: cancelToken,
      );

      return response.data as List<String>;
    });
  }
}

@riverpod
RemoteProductDatasource remoteProductDatasource(RemoteProductDatasourceRef ref) {
  return RemoteProductDatasource(apiClient: ref.read(apiClientProvider));
}
