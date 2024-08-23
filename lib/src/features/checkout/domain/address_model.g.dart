// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      type: json['type'] as String,
      addressLine1: json['addressLine1'] as String,
      state: json['state'] as String,
      zip: json['zip'] as String,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'addressLine1': instance.addressLine1,
      'state': instance.state,
      'zip': instance.zip,
    };
