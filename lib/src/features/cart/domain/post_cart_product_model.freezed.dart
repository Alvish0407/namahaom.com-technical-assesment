// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_cart_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostCartProduct _$PostCartProductFromJson(Map<String, dynamic> json) {
return _PostCartProduct.fromJson(json);
}

/// @nodoc
mixin _$PostCartProduct {

 int get id => throw _privateConstructorUsedError; set id(int value) => throw _privateConstructorUsedError; int get quantity => throw _privateConstructorUsedError; set quantity(int value) => throw _privateConstructorUsedError;






/// Serializes this PostCartProduct to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of PostCartProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$PostCartProductCopyWith<PostCartProduct> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $PostCartProductCopyWith<$Res>  {
  factory $PostCartProductCopyWith(PostCartProduct value, $Res Function(PostCartProduct) then) = _$PostCartProductCopyWithImpl<$Res, PostCartProduct>;
@useResult
$Res call({
 int id, int quantity
});



}

/// @nodoc
class _$PostCartProductCopyWithImpl<$Res,$Val extends PostCartProduct> implements $PostCartProductCopyWith<$Res> {
  _$PostCartProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of PostCartProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? quantity = null,}) {
  return _then(_value.copyWith(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _value.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  )as $Val);
}

}


/// @nodoc
abstract class _$$PostCartProductImplCopyWith<$Res> implements $PostCartProductCopyWith<$Res> {
  factory _$$PostCartProductImplCopyWith(_$PostCartProductImpl value, $Res Function(_$PostCartProductImpl) then) = __$$PostCartProductImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 int id, int quantity
});



}

/// @nodoc
class __$$PostCartProductImplCopyWithImpl<$Res> extends _$PostCartProductCopyWithImpl<$Res, _$PostCartProductImpl> implements _$$PostCartProductImplCopyWith<$Res> {
  __$$PostCartProductImplCopyWithImpl(_$PostCartProductImpl _value, $Res Function(_$PostCartProductImpl) _then)
      : super(_value, _then);


/// Create a copy of PostCartProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? quantity = null,}) {
  return _then(_$PostCartProductImpl(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _value.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$PostCartProductImpl  implements _PostCartProduct {
   _$PostCartProductImpl({required this.id, this.quantity = 1});

  factory _$PostCartProductImpl.fromJson(Map<String, dynamic> json) => _$$PostCartProductImplFromJson(json);

@override  int id;
@override@JsonKey()  int quantity;

@override
String toString() {
  return 'PostCartProduct(id: $id, quantity: $quantity)';
}




/// Create a copy of PostCartProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$PostCartProductImplCopyWith<_$PostCartProductImpl> get copyWith => __$$PostCartProductImplCopyWithImpl<_$PostCartProductImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$PostCartProductImplToJson(this, );
}
}


abstract class _PostCartProduct implements PostCartProduct {
   factory _PostCartProduct({required  int id,  int quantity}) = _$PostCartProductImpl;
  

  factory _PostCartProduct.fromJson(Map<String, dynamic> json) = _$PostCartProductImpl.fromJson;

@override int get id; set id(int value);@override int get quantity; set quantity(int value);
/// Create a copy of PostCartProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$PostCartProductImplCopyWith<_$PostCartProductImpl> get copyWith => throw _privateConstructorUsedError;

}
