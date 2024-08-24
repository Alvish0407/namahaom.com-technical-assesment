import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/json_convertors.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
class Cart with _$Cart {
  const factory Cart({
    @Default(0.0) double total,
    @Default(0) int totalProducts,
    @Default(0) int totalQuantity,
    @Default(0.0) double discountedTotal,
    @Default([]) List<CartItem> products,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required int id,
    required String title,
    required double price,
    required double total,
    required int quantity,
    required double discountedPrice,
    required double discountPercentage,
    @HttpUriConverter() Uri? thumbnail,
  }) = _ProductItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
}

extension CartX on Cart {
  double get discount => total - discountedTotal; // Discount amount
}

extension CartItemX on CartItem {
  double get totalPrice => price * quantity;
}
