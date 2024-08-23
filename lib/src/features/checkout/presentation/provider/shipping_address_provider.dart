import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/checkout_repository.dart';
import '../../domain/address_model.dart';

part 'shipping_address_provider.g.dart';

@riverpod
class ShippingAddress extends _$ShippingAddress {
  @override
  Future<List<Address>> build() {
    return ref.watch(checkoutRepositoryProvider).getAddresses();
  }
}
