// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Cart _$CartFromJson(Map<String, dynamic> json) {
return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {

 double get total => throw _privateConstructorUsedError; int get totalProducts => throw _privateConstructorUsedError; int get totalQuantity => throw _privateConstructorUsedError; double get discountedTotal => throw _privateConstructorUsedError; List<CartItem> get products => throw _privateConstructorUsedError;






/// Serializes this Cart to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $CartCopyWith<$Res>  {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) = _$CartCopyWithImpl<$Res, Cart>;
@useResult
$Res call({
 double total, int totalProducts, int totalQuantity, double discountedTotal, List<CartItem> products
});



}

/// @nodoc
class _$CartCopyWithImpl<$Res,$Val extends Cart> implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? totalProducts = null,Object? totalQuantity = null,Object? discountedTotal = null,Object? products = null,}) {
  return _then(_value.copyWith(
total: null == total ? _value.total : total // ignore: cast_nullable_to_non_nullable
as double,totalProducts: null == totalProducts ? _value.totalProducts : totalProducts // ignore: cast_nullable_to_non_nullable
as int,totalQuantity: null == totalQuantity ? _value.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as int,discountedTotal: null == discountedTotal ? _value.discountedTotal : discountedTotal // ignore: cast_nullable_to_non_nullable
as double,products: null == products ? _value.products : products // ignore: cast_nullable_to_non_nullable
as List<CartItem>,
  )as $Val);
}

}


/// @nodoc
abstract class _$$CartImplCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$CartImplCopyWith(_$CartImpl value, $Res Function(_$CartImpl) then) = __$$CartImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 double total, int totalProducts, int totalQuantity, double discountedTotal, List<CartItem> products
});



}

/// @nodoc
class __$$CartImplCopyWithImpl<$Res> extends _$CartCopyWithImpl<$Res, _$CartImpl> implements _$$CartImplCopyWith<$Res> {
  __$$CartImplCopyWithImpl(_$CartImpl _value, $Res Function(_$CartImpl) _then)
      : super(_value, _then);


/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? totalProducts = null,Object? totalQuantity = null,Object? discountedTotal = null,Object? products = null,}) {
  return _then(_$CartImpl(
total: null == total ? _value.total : total // ignore: cast_nullable_to_non_nullable
as double,totalProducts: null == totalProducts ? _value.totalProducts : totalProducts // ignore: cast_nullable_to_non_nullable
as int,totalQuantity: null == totalQuantity ? _value.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as int,discountedTotal: null == discountedTotal ? _value.discountedTotal : discountedTotal // ignore: cast_nullable_to_non_nullable
as double,products: null == products ? _value._products : products // ignore: cast_nullable_to_non_nullable
as List<CartItem>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$CartImpl  implements _Cart {
  const _$CartImpl({this.total = 0.0, this.totalProducts = 0, this.totalQuantity = 0, this.discountedTotal = 0.0, final  List<CartItem> products = const []}): _products = products;

  factory _$CartImpl.fromJson(Map<String, dynamic> json) => _$$CartImplFromJson(json);

@override@JsonKey() final  double total;
@override@JsonKey() final  int totalProducts;
@override@JsonKey() final  int totalQuantity;
@override@JsonKey() final  double discountedTotal;
 final  List<CartItem> _products;
@override@JsonKey() List<CartItem> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


@override
String toString() {
  return 'Cart(total: $total, totalProducts: $totalProducts, totalQuantity: $totalQuantity, discountedTotal: $discountedTotal, products: $products)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$CartImpl&&(identical(other.total, total) || other.total == total)&&(identical(other.totalProducts, totalProducts) || other.totalProducts == totalProducts)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.discountedTotal, discountedTotal) || other.discountedTotal == discountedTotal)&&const DeepCollectionEquality().equals(other._products, _products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,totalProducts,totalQuantity,discountedTotal,const DeepCollectionEquality().hash(_products));

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$CartImplCopyWith<_$CartImpl> get copyWith => __$$CartImplCopyWithImpl<_$CartImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$CartImplToJson(this, );
}
}


abstract class _Cart implements Cart {
  const factory _Cart({final  double total, final  int totalProducts, final  int totalQuantity, final  double discountedTotal, final  List<CartItem> products}) = _$CartImpl;
  

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

@override double get total;@override int get totalProducts;@override int get totalQuantity;@override double get discountedTotal;@override List<CartItem> get products;
/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$CartImplCopyWith<_$CartImpl> get copyWith => throw _privateConstructorUsedError;

}

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
return _ProductItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {

 int get id => throw _privateConstructorUsedError; String get title => throw _privateConstructorUsedError; double get price => throw _privateConstructorUsedError; double get total => throw _privateConstructorUsedError; int get quantity => throw _privateConstructorUsedError; double get discountedPrice => throw _privateConstructorUsedError; double get discountPercentage => throw _privateConstructorUsedError;@HttpUriConverter() Uri? get thumbnail => throw _privateConstructorUsedError;






/// Serializes this CartItem to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$CartItemCopyWith<CartItem> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $CartItemCopyWith<$Res>  {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) = _$CartItemCopyWithImpl<$Res, CartItem>;
@useResult
$Res call({
 int id, String title, double price, double total, int quantity, double discountedPrice, double discountPercentage,@HttpUriConverter() Uri? thumbnail
});



}

/// @nodoc
class _$CartItemCopyWithImpl<$Res,$Val extends CartItem> implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? price = null,Object? total = null,Object? quantity = null,Object? discountedPrice = null,Object? discountPercentage = null,Object? thumbnail = freezed,}) {
  return _then(_value.copyWith(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _value.price : price // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _value.total : total // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _value.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,discountedPrice: null == discountedPrice ? _value.discountedPrice : discountedPrice // ignore: cast_nullable_to_non_nullable
as double,discountPercentage: null == discountPercentage ? _value.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double,thumbnail: freezed == thumbnail ? _value.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as Uri?,
  )as $Val);
}

}


/// @nodoc
abstract class _$$ProductItemImplCopyWith<$Res> implements $CartItemCopyWith<$Res> {
  factory _$$ProductItemImplCopyWith(_$ProductItemImpl value, $Res Function(_$ProductItemImpl) then) = __$$ProductItemImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 int id, String title, double price, double total, int quantity, double discountedPrice, double discountPercentage,@HttpUriConverter() Uri? thumbnail
});



}

/// @nodoc
class __$$ProductItemImplCopyWithImpl<$Res> extends _$CartItemCopyWithImpl<$Res, _$ProductItemImpl> implements _$$ProductItemImplCopyWith<$Res> {
  __$$ProductItemImplCopyWithImpl(_$ProductItemImpl _value, $Res Function(_$ProductItemImpl) _then)
      : super(_value, _then);


/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? price = null,Object? total = null,Object? quantity = null,Object? discountedPrice = null,Object? discountPercentage = null,Object? thumbnail = freezed,}) {
  return _then(_$ProductItemImpl(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _value.price : price // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _value.total : total // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _value.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,discountedPrice: null == discountedPrice ? _value.discountedPrice : discountedPrice // ignore: cast_nullable_to_non_nullable
as double,discountPercentage: null == discountPercentage ? _value.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double,thumbnail: freezed == thumbnail ? _value.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as Uri?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$ProductItemImpl  implements _ProductItem {
  const _$ProductItemImpl({required this.id, required this.title, required this.price, required this.total, required this.quantity, required this.discountedPrice, required this.discountPercentage, @HttpUriConverter() this.thumbnail});

  factory _$ProductItemImpl.fromJson(Map<String, dynamic> json) => _$$ProductItemImplFromJson(json);

@override final  int id;
@override final  String title;
@override final  double price;
@override final  double total;
@override final  int quantity;
@override final  double discountedPrice;
@override final  double discountPercentage;
@override@HttpUriConverter() final  Uri? thumbnail;

@override
String toString() {
  return 'CartItem(id: $id, title: $title, price: $price, total: $total, quantity: $quantity, discountedPrice: $discountedPrice, discountPercentage: $discountPercentage, thumbnail: $thumbnail)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ProductItemImpl&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.total, total) || other.total == total)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.discountedPrice, discountedPrice) || other.discountedPrice == discountedPrice)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,price,total,quantity,discountedPrice,discountPercentage,thumbnail);

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$ProductItemImplCopyWith<_$ProductItemImpl> get copyWith => __$$ProductItemImplCopyWithImpl<_$ProductItemImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$ProductItemImplToJson(this, );
}
}


abstract class _ProductItem implements CartItem {
  const factory _ProductItem({required final  int id, required final  String title, required final  double price, required final  double total, required final  int quantity, required final  double discountedPrice, required final  double discountPercentage, @HttpUriConverter() final  Uri? thumbnail}) = _$ProductItemImpl;
  

  factory _ProductItem.fromJson(Map<String, dynamic> json) = _$ProductItemImpl.fromJson;

@override int get id;@override String get title;@override double get price;@override double get total;@override int get quantity;@override double get discountedPrice;@override double get discountPercentage;@override@HttpUriConverter() Uri? get thumbnail;
/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$ProductItemImplCopyWith<_$ProductItemImpl> get copyWith => throw _privateConstructorUsedError;

}
