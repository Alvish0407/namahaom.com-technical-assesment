// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      totalProducts: (json['totalProducts'] as num?)?.toInt() ?? 0,
      totalQuantity: (json['totalQuantity'] as num?)?.toInt() ?? 0,
      discountedTotal: (json['discountedTotal'] as num?)?.toDouble() ?? 0.0,
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalProducts': instance.totalProducts,
      'totalQuantity': instance.totalQuantity,
      'discountedTotal': instance.discountedTotal,
      'products': instance.products.map((e) => e.toJson()).toList(),
    };

_$ProductItemImpl _$$ProductItemImplFromJson(Map<String, dynamic> json) =>
    _$ProductItemImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      discountedPrice: (json['discountedPrice'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      thumbnail:
          const HttpUriConverter().fromJson(json['thumbnail'] as String?),
    );

Map<String, dynamic> _$$ProductItemImplToJson(_$ProductItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'total': instance.total,
      'quantity': instance.quantity,
      'discountedPrice': instance.discountedPrice,
      'discountPercentage': instance.discountPercentage,
      'thumbnail': const HttpUriConverter().toJson(instance.thumbnail),
    };
