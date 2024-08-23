import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required String type,
    required String addressLine1,
    required String state,
    required String zip,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}

extension AddressX on Address {
  String get fullAddress => '$addressLine1, $state, $zip';
}
