// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {

 String? get brand => throw _privateConstructorUsedError; int get id => throw _privateConstructorUsedError; String get title => throw _privateConstructorUsedError; double get price => throw _privateConstructorUsedError; double get rating => throw _privateConstructorUsedError; String get category => throw _privateConstructorUsedError; String get description => throw _privateConstructorUsedError;@HttpUriConverter() Uri? get thumbnail => throw _privateConstructorUsedError; double get discountPercentage => throw _privateConstructorUsedError;






/// Serializes this Product to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) = _$ProductCopyWithImpl<$Res, Product>;
@useResult
$Res call({
 String? brand, int id, String title, double price, double rating, String category, String description,@HttpUriConverter() Uri? thumbnail, double discountPercentage
});



}

/// @nodoc
class _$ProductCopyWithImpl<$Res,$Val extends Product> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? brand = freezed,Object? id = null,Object? title = null,Object? price = null,Object? rating = null,Object? category = null,Object? description = null,Object? thumbnail = freezed,Object? discountPercentage = null,}) {
  return _then(_value.copyWith(
brand: freezed == brand ? _value.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _value.price : price // ignore: cast_nullable_to_non_nullable
as double,rating: null == rating ? _value.rating : rating // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _value.category : category // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _value.description : description // ignore: cast_nullable_to_non_nullable
as String,thumbnail: freezed == thumbnail ? _value.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as Uri?,discountPercentage: null == discountPercentage ? _value.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double,
  )as $Val);
}

}


/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(_$ProductImpl value, $Res Function(_$ProductImpl) then) = __$$ProductImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String? brand, int id, String title, double price, double rating, String category, String description,@HttpUriConverter() Uri? thumbnail, double discountPercentage
});



}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res, _$ProductImpl> implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(_$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);


/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? brand = freezed,Object? id = null,Object? title = null,Object? price = null,Object? rating = null,Object? category = null,Object? description = null,Object? thumbnail = freezed,Object? discountPercentage = null,}) {
  return _then(_$ProductImpl(
brand: freezed == brand ? _value.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _value.price : price // ignore: cast_nullable_to_non_nullable
as double,rating: null == rating ? _value.rating : rating // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _value.category : category // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _value.description : description // ignore: cast_nullable_to_non_nullable
as String,thumbnail: freezed == thumbnail ? _value.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as Uri?,discountPercentage: null == discountPercentage ? _value.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$ProductImpl  implements _Product {
  const _$ProductImpl({this.brand, required this.id, required this.title, required this.price, required this.rating, required this.category, required this.description, @HttpUriConverter() this.thumbnail, required this.discountPercentage});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) => _$$ProductImplFromJson(json);

@override final  String? brand;
@override final  int id;
@override final  String title;
@override final  double price;
@override final  double rating;
@override final  String category;
@override final  String description;
@override@HttpUriConverter() final  Uri? thumbnail;
@override final  double discountPercentage;

@override
String toString() {
  return 'Product(brand: $brand, id: $id, title: $title, price: $price, rating: $rating, category: $category, description: $description, thumbnail: $thumbnail, discountPercentage: $discountPercentage)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ProductImpl&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,brand,id,title,price,rating,category,description,thumbnail,discountPercentage);

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$ProductImplCopyWith<_$ProductImpl> get copyWith => __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$ProductImplToJson(this, );
}
}


abstract class _Product implements Product {
  const factory _Product({final  String? brand, required final  int id, required final  String title, required final  double price, required final  double rating, required final  String category, required final  String description, @HttpUriConverter() final  Uri? thumbnail, required final  double discountPercentage}) = _$ProductImpl;
  

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

@override String? get brand;@override int get id;@override String get title;@override double get price;@override double get rating;@override String get category;@override String get description;@override@HttpUriConverter() Uri? get thumbnail;@override double get discountPercentage;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$ProductImplCopyWith<_$ProductImpl> get copyWith => throw _privateConstructorUsedError;

}
