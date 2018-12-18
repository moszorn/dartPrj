// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shape.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shape _$ShapeFromJson(Map<String, dynamic> json) {
  return Shape(
      shapeName: json['shapeName'] as String,
      property: json['property'] == null
          ? null
          : Property.fromJson(json['property'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ShapeToJson(Shape instance) => <String, dynamic>{
      'shapeName': instance.shapeName,
      'property': instance.property
    };
