// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      brand: json['brand'] as String?,
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      category: json['category'] as String,
      description: json['description'] as String,
      thumbnail:
          const HttpUriConverter().fromJson(json['thumbnail'] as String?),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'rating': instance.rating,
      'category': instance.category,
      'description': instance.description,
      'thumbnail': const HttpUriConverter().toJson(instance.thumbnail),
      'discountPercentage': instance.discountPercentage,
    };
