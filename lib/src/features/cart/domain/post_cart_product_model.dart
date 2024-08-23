import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_cart_product_model.freezed.dart';
part 'post_cart_product_model.g.dart';

@unfreezed
class PostCartProduct with _$PostCartProduct {
  factory PostCartProduct({
    required int id,
    @Default(1) int quantity,
  }) = _PostCartProduct;

  factory PostCartProduct.fromJson(Map<String, dynamic> json) => _$PostCartProductFromJson(json);
}

extension PostCartProductX on PostCartProduct {
  void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  void incrementQuantity() {
    setQuantity(quantity + 1);
  }

  void decrementQuantity() {
    if (quantity > 0) {
      setQuantity(quantity - 1);
    }
  }
}
