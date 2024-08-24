import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../cart/domain/cart_model.dart';
import '../../domain/address_model.dart';
import '../../domain/order_summary_model.dart';
import '../../domain/payment_method_model.dart';

part 'order_summary_provider.g.dart';

@riverpod
class CartOrderSummary extends _$CartOrderSummary {
  @override
  OrderSummary build() {
    return const OrderSummary();
  }

  void updateCart(Cart cart) {
    state = state.copyWith(cart: cart);
  }

  void updateShippingAddress(Address address) {
    state = state.copyWith(shippingAddress: address);
  }

  void updatePaymentMethod(PaymentMethod paymentMethod) {
    state = state.copyWith(paymentMethod: paymentMethod);
  }
}
