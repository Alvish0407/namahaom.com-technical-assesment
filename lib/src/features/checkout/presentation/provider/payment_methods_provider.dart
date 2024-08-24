import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/checkout_repository.dart';
import '../../domain/payment_method_model.dart';

part 'payment_methods_provider.g.dart';

@riverpod
class PaymentMethods extends _$PaymentMethods {
  @override
  Future<List<PaymentMethod>> build() {
    return ref.watch(checkoutRepositoryProvider).getPaymentMethods();
  }
}
