import 'package:json_annotation/json_annotation.dart';
import 'property.dart';

part 'shape.g.dart';

@JsonSerializable()
class Shape{

  String shapeName;
  Property property;

  Shape({this.shapeName,this.property});

  factory Shape.fromJson(Map<String,dynamic> json) => _$ShapeFromJson(json);
  Map<String,dynamic> toJson()=> _$ShapeToJson(this);
}

