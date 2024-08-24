import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/app_assets.dart';
import '../../domain/address_model.dart';
import '../../domain/payment_method_model.dart';

part 'mock_checkout_datasource.g.dart';
part 'mock_checkout_datasource_data.dart';

class MockCheckoutDatasource {
  MockCheckoutDatasource();

  Future<List<Address>> getAddresses() async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockAddresses;
  }

  Future<List<PaymentMethod>> getPaymentMethods() async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockPaymentMethods;
  }
}

@riverpod
MockCheckoutDatasource mockCheckoutDatasource(MockCheckoutDatasourceRef ref) {
  return MockCheckoutDatasource();
}
