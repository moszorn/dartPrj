import 'package:json_annotation/json_annotation.dart';

part 'property.g.dart';


@JsonSerializable()
class Property{
  double width;
  double breadth;
  double height;

  Property({this.width,this.breadth,this.height});

  factory Property.fromJson(Map<String,dynamic> json)=> _$PropertyFromJson(json);

  Map<String,dynamic> toJson() => _$PropertyToJson(this);

}