// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
      city: json['city'] as String,
      streets: (json['streets'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$AddressToJson(Address instance) =>
    <String, dynamic>{'city': instance.city, 'streets': instance.streets};
