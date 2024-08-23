import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/cart_model.dart';
import '../../domain/post_cart_product_model.dart';
import '../datasource/remote_cart_datasource.dart';

part 'cart_repository.g.dart';

class CartRepository {
  RemoteCartDatasource remoteCartDatasource;
  CartRepository(this.remoteCartDatasource);

  Future<Cart> updateCart({
    CancelToken? cancelToken,
    required List<PostCartProduct> cartItems,
  }) async {
    return remoteCartDatasource.updateCart(cartItems: cartItems, cancelToken: cancelToken);
  }
}

@riverpod
CartRepository cartRepository(CartRepositoryRef ref) {
  return CartRepository(ref.read(remoteCartDatasourceProvider));
}
