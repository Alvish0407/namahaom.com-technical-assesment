// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_cart_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostCartProductImpl _$$PostCartProductImplFromJson(
        Map<String, dynamic> json) =>
    _$PostCartProductImpl(
      id: (json['id'] as num).toInt(),
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$PostCartProductImplToJson(
        _$PostCartProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
    };
