// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderSummary _$OrderSummaryFromJson(Map<String, dynamic> json) {
return _OrderSummary.fromJson(json);
}

/// @nodoc
mixin _$OrderSummary {

 Cart? get cart => throw _privateConstructorUsedError; Address? get shippingAddress => throw _privateConstructorUsedError; PaymentMethod? get paymentMethod => throw _privateConstructorUsedError;






/// Serializes this OrderSummary to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$OrderSummaryCopyWith<OrderSummary> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $OrderSummaryCopyWith<$Res>  {
  factory $OrderSummaryCopyWith(OrderSummary value, $Res Function(OrderSummary) then) = _$OrderSummaryCopyWithImpl<$Res, OrderSummary>;
@useResult
$Res call({
 Cart? cart, Address? shippingAddress, PaymentMethod? paymentMethod
});


$CartCopyWith<$Res>? get cart;$AddressCopyWith<$Res>? get shippingAddress;$PaymentMethodCopyWith<$Res>? get paymentMethod;
}

/// @nodoc
class _$OrderSummaryCopyWithImpl<$Res,$Val extends OrderSummary> implements $OrderSummaryCopyWith<$Res> {
  _$OrderSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cart = freezed,Object? shippingAddress = freezed,Object? paymentMethod = freezed,}) {
  return _then(_value.copyWith(
cart: freezed == cart ? _value.cart : cart // ignore: cast_nullable_to_non_nullable
as Cart?,shippingAddress: freezed == shippingAddress ? _value.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as Address?,paymentMethod: freezed == paymentMethod ? _value.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,
  )as $Val);
}
/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartCopyWith<$Res>? get cart {
    if (_value.cart == null) {
    return null;
  }

  return $CartCopyWith<$Res>(_value.cart!, (value) {
    return _then(_value.copyWith(cart: value) as $Val);
  });
}/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res>? get shippingAddress {
    if (_value.shippingAddress == null) {
    return null;
  }

  return $AddressCopyWith<$Res>(_value.shippingAddress!, (value) {
    return _then(_value.copyWith(shippingAddress: value) as $Val);
  });
}/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentMethodCopyWith<$Res>? get paymentMethod {
    if (_value.paymentMethod == null) {
    return null;
  }

  return $PaymentMethodCopyWith<$Res>(_value.paymentMethod!, (value) {
    return _then(_value.copyWith(paymentMethod: value) as $Val);
  });
}
}


/// @nodoc
abstract class _$$OrderSummaryImplCopyWith<$Res> implements $OrderSummaryCopyWith<$Res> {
  factory _$$OrderSummaryImplCopyWith(_$OrderSummaryImpl value, $Res Function(_$OrderSummaryImpl) then) = __$$OrderSummaryImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 Cart? cart, Address? shippingAddress, PaymentMethod? paymentMethod
});


@override $CartCopyWith<$Res>? get cart;@override $AddressCopyWith<$Res>? get shippingAddress;@override $PaymentMethodCopyWith<$Res>? get paymentMethod;
}

/// @nodoc
class __$$OrderSummaryImplCopyWithImpl<$Res> extends _$OrderSummaryCopyWithImpl<$Res, _$OrderSummaryImpl> implements _$$OrderSummaryImplCopyWith<$Res> {
  __$$OrderSummaryImplCopyWithImpl(_$OrderSummaryImpl _value, $Res Function(_$OrderSummaryImpl) _then)
      : super(_value, _then);


/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cart = freezed,Object? shippingAddress = freezed,Object? paymentMethod = freezed,}) {
  return _then(_$OrderSummaryImpl(
cart: freezed == cart ? _value.cart : cart // ignore: cast_nullable_to_non_nullable
as Cart?,shippingAddress: freezed == shippingAddress ? _value.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as Address?,paymentMethod: freezed == paymentMethod ? _value.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$OrderSummaryImpl  implements _OrderSummary {
  const _$OrderSummaryImpl({this.cart, this.shippingAddress, this.paymentMethod});

  factory _$OrderSummaryImpl.fromJson(Map<String, dynamic> json) => _$$OrderSummaryImplFromJson(json);

@override final  Cart? cart;
@override final  Address? shippingAddress;
@override final  PaymentMethod? paymentMethod;

@override
String toString() {
  return 'OrderSummary(cart: $cart, shippingAddress: $shippingAddress, paymentMethod: $paymentMethod)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$OrderSummaryImpl&&(identical(other.cart, cart) || other.cart == cart)&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cart,shippingAddress,paymentMethod);

/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$OrderSummaryImplCopyWith<_$OrderSummaryImpl> get copyWith => __$$OrderSummaryImplCopyWithImpl<_$OrderSummaryImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$OrderSummaryImplToJson(this, );
}
}


abstract class _OrderSummary implements OrderSummary {
  const factory _OrderSummary({final  Cart? cart, final  Address? shippingAddress, final  PaymentMethod? paymentMethod}) = _$OrderSummaryImpl;
  

  factory _OrderSummary.fromJson(Map<String, dynamic> json) = _$OrderSummaryImpl.fromJson;

@override Cart? get cart;@override Address? get shippingAddress;@override PaymentMethod? get paymentMethod;
/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$OrderSummaryImplCopyWith<_$OrderSummaryImpl> get copyWith => throw _privateConstructorUsedError;

}
