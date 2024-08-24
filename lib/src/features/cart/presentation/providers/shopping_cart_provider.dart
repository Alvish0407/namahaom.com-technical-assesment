import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../services/secure_storage.dart';
import '../../../../utils/exception_handler.dart';
import '../../../../utils/extensions.dart';
import '../../data/repositories/cart_repository.dart';
import '../../domain/cart_model.dart';
import '../../domain/post_cart_product_model.dart';

part 'shopping_cart_provider.g.dart';

@riverpod
class ShoppingCart extends _$ShoppingCart {
  @override
  Future<Cart> build() {
    final secureStorage = ref.read(secureStorageProvider).requireValue;
    final cart = secureStorage.getDecodedCart ?? const Cart();

    return Future.value(cart);
  }

  List<PostCartProduct> _toPostCartProducts(List<CartItem>? cartItems) {
    if (cartItems == null) throw const AppException(message: "Cart is not initialized");

    return cartItems.map((e) => PostCartProduct(id: e.id, quantity: e.quantity)).toList();
  }

  Future<void> _refreshCart(List<PostCartProduct> newProducts) async {
    // If we send a product with quantity 0 in an API, it will return item with quantity 1 in response, better remove it
    newProducts.removeWhere((e) => e.quantity == 0);

    // If cart is empty, we don't need to call an API
    // and if we do, it will throw an error
    newProducts.isEmpty
        ? state = const AsyncValue.data(Cart())
        : state = await AsyncValue.guard(() async {
            return await ref.read(cartRepositoryProvider).updateCart(cartItems: newProducts);
          });
  }

  Future<void> addProduct(int id) async {
    final newCartProduct = PostCartProduct(id: id);

    final convertedproducts = _toPostCartProducts(state.value?.products);
    convertedproducts.add(newCartProduct);

    await _refreshCart(convertedproducts);
  }

  Future<void> removeItem(int id) async {
    // Create new list without the item to be removed
    final updatedProducts = state.value?.products.where((e) => e.id != id).toList();

    final convertedproducts = _toPostCartProducts(updatedProducts);
    await _refreshCart(convertedproducts);
  }

  Future<void> addQuantity(int id) async {
    final convertedproducts = _toPostCartProducts(state.value?.products);
    convertedproducts.firstWhere((e) => e.id == id).incrementQuantity();

    await _refreshCart(convertedproducts);
  }

  Future<void> minusQuantity(int id) async {
    final convertedproducts = _toPostCartProducts(state.value?.products);
    convertedproducts.firstWhere((e) => e.id == id).decrementQuantity();

    await _refreshCart(convertedproducts);
  }

  CartItem? getProductById(int id) {
    return state.value?.products.firstWhereOrNull((e) => e.id == id);
  }
}
