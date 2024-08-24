import 'package:freezed_annotation/freezed_annotation.dart';

import '../../cart/domain/cart_model.dart';
import 'address_model.dart';
import 'payment_method_model.dart';

part 'order_summary_model.freezed.dart';
part 'order_summary_model.g.dart';

@freezed
class OrderSummary with _$OrderSummary {
  const factory OrderSummary({
    Cart? cart,
    Address? shippingAddress,
    PaymentMethod? paymentMethod,
  }) = _OrderSummary;

  factory OrderSummary.fromJson(Map<String, dynamic> json) => _$OrderSummaryFromJson(json);
}
