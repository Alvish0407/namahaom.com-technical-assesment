// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Address _$AddressFromJson(Map<String, dynamic> json) {
return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {

 String get type => throw _privateConstructorUsedError; String get addressLine1 => throw _privateConstructorUsedError; String get state => throw _privateConstructorUsedError; String get zip => throw _privateConstructorUsedError;






/// Serializes this Address to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $AddressCopyWith<$Res>  {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) = _$AddressCopyWithImpl<$Res, Address>;
@useResult
$Res call({
 String type, String addressLine1, String state, String zip
});



}

/// @nodoc
class _$AddressCopyWithImpl<$Res,$Val extends Address> implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? addressLine1 = null,Object? state = null,Object? zip = null,}) {
  return _then(_value.copyWith(
type: null == type ? _value.type : type // ignore: cast_nullable_to_non_nullable
as String,addressLine1: null == addressLine1 ? _value.addressLine1 : addressLine1 // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _value.state : state // ignore: cast_nullable_to_non_nullable
as String,zip: null == zip ? _value.zip : zip // ignore: cast_nullable_to_non_nullable
as String,
  )as $Val);
}

}


/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(_$AddressImpl value, $Res Function(_$AddressImpl) then) = __$$AddressImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String type, String addressLine1, String state, String zip
});



}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res> extends _$AddressCopyWithImpl<$Res, _$AddressImpl> implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(_$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);


/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? addressLine1 = null,Object? state = null,Object? zip = null,}) {
  return _then(_$AddressImpl(
type: null == type ? _value.type : type // ignore: cast_nullable_to_non_nullable
as String,addressLine1: null == addressLine1 ? _value.addressLine1 : addressLine1 // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _value.state : state // ignore: cast_nullable_to_non_nullable
as String,zip: null == zip ? _value.zip : zip // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$AddressImpl  implements _Address {
  const _$AddressImpl({required this.type, required this.addressLine1, required this.state, required this.zip});

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) => _$$AddressImplFromJson(json);

@override final  String type;
@override final  String addressLine1;
@override final  String state;
@override final  String zip;

@override
String toString() {
  return 'Address(type: $type, addressLine1: $addressLine1, state: $state, zip: $zip)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$AddressImpl&&(identical(other.type, type) || other.type == type)&&(identical(other.addressLine1, addressLine1) || other.addressLine1 == addressLine1)&&(identical(other.state, state) || other.state == state)&&(identical(other.zip, zip) || other.zip == zip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,addressLine1,state,zip);

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$AddressImplCopyWith<_$AddressImpl> get copyWith => __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$AddressImplToJson(this, );
}
}


abstract class _Address implements Address {
  const factory _Address({required final  String type, required final  String addressLine1, required final  String state, required final  String zip}) = _$AddressImpl;
  

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

@override String get type;@override String get addressLine1;@override String get state;@override String get zip;
/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$AddressImplCopyWith<_$AddressImpl> get copyWith => throw _privateConstructorUsedError;

}
