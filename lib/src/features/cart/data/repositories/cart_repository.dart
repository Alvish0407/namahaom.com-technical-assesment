import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../services/secure_storage.dart';
import '../../domain/cart_model.dart';
import '../../domain/post_cart_product_model.dart';
import '../datasource/remote_cart_datasource.dart';

part 'cart_repository.g.dart';

class CartRepository {
  CartRepositoryRef? ref;
  RemoteCartDatasource remoteCartDatasource;

  CartRepository(this.remoteCartDatasource, {this.ref});

  Future<Cart> updateCart({
    CancelToken? cancelToken,
    required List<PostCartProduct> cartItems,
  }) async {
    final response = await remoteCartDatasource.updateCart(
      cartItems: cartItems,
      cancelToken: cancelToken,
    );

    // Save the cart to secure storage to persist the cart data between multiple app sessions
    await ref
        ?.read(secureStorageProvider)
        .requireValue
        .set(SecureStorageKey.cart, jsonEncode(response.toJson()));

    return response;
  }
}

@riverpod
CartRepository cartRepository(CartRepositoryRef ref) {
  return CartRepository(ref.read(remoteCartDatasourceProvider), ref: ref);
}
