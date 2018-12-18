// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Property _$PropertyFromJson(Map<String, dynamic> json) {
  return Property(
      width: (json['width'] as num)?.toDouble(),
      breadth: (json['breadth'] as num)?.toDouble(),
      height: (json['height'] as num)?.toDouble());
}

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
      'width': instance.width,
      'breadth': instance.breadth,
      'height': instance.height
    };
