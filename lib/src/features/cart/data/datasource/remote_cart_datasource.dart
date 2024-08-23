import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../services/api_client.dart';
import '../../../../utils/exception_handler.dart';
import '../../domain/cart_model.dart';
import '../../domain/post_cart_product_model.dart';

part 'remote_cart_datasource.g.dart';

class RemoteCartDatasource {
  final ApiClient apiClient;
  RemoteCartDatasource({required this.apiClient});

  Future<Cart> updateCart({
    CancelToken? cancelToken,
    required List<PostCartProduct> cartItems,
  }) async {
    return handleException<Cart>(() async {
      final response = await apiClient.httpClient.post(
        '/carts/add',
        data: {
          // We have to pass the [userId] since required by the API
          // It doesn't alter the result since we don't use it
          'userId': 1,
          'products': cartItems.map((e) => e.toJson()).toList(),
        },
        cancelToken: cancelToken,
      );

      return Cart.fromJson(response.data);
    });
  }
}

@riverpod
RemoteCartDatasource remoteCartDatasource(RemoteCartDatasourceRef ref) {
  return RemoteCartDatasource(apiClient: ref.read(apiClientProvider));
}
