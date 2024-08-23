import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/address_model.dart';

part 'mock_checkout_datasource.g.dart';
part 'mock_checkout_datasource_data.dart';

class MockCheckoutDatasource {
  MockCheckoutDatasource();

  Future<List<Address>> getAddresses() async {
    await Future.delayed(const Duration(seconds: 2));
    return _mockAddresses;
  }
}

@riverpod
MockCheckoutDatasource mockCheckoutDatasource(MockCheckoutDatasourceRef ref) {
  return MockCheckoutDatasource();
}
