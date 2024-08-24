// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderSummaryImpl _$$OrderSummaryImplFromJson(Map<String, dynamic> json) =>
    _$OrderSummaryImpl(
      cart: json['cart'] == null
          ? null
          : Cart.fromJson(json['cart'] as Map<String, dynamic>),
      shippingAddress: json['shippingAddress'] == null
          ? null
          : Address.fromJson(json['shippingAddress'] as Map<String, dynamic>),
      paymentMethod: json['paymentMethod'] == null
          ? null
          : PaymentMethod.fromJson(
              json['paymentMethod'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderSummaryImplToJson(_$OrderSummaryImpl instance) =>
    <String, dynamic>{
      'cart': instance.cart?.toJson(),
      'shippingAddress': instance.shippingAddress?.toJson(),
      'paymentMethod': instance.paymentMethod?.toJson(),
    };
