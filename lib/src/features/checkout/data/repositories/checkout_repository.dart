import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/address_model.dart';
import '../datasource/mock_checkout_datasource.dart';

part 'checkout_repository.g.dart';

class CheckoutRepository {
  final MockCheckoutDatasource mockCheckoutDatasource;
  CheckoutRepository(this.mockCheckoutDatasource);

  Future<List<Address>> getAddresses() async {
    return mockCheckoutDatasource.getAddresses();
  }
}

@riverpod
CheckoutRepository checkoutRepository(CheckoutRepositoryRef ref) {
  return CheckoutRepository(ref.watch(mockCheckoutDatasourceProvider));
}
