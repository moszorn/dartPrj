

import 'dart:async';
import 'dart:math' as math;
import 'dart:io';
import 'dart:convert' ;
import 'package:poc/poc.dart' as poc;

import 'package:poc/models/user.dart';
import 'package:poc/models/address.dart';

import 'package:poc/models/property.dart';
import 'package:poc/models/shape.dart';

main(List<String> arguments) async{
   getRemoteData();
}
       


const String propertyJson = '{"breadth":12.6,"width":0.89,"height":20}';
const String shapeJson = '{ "shapeName":"triangle", "property": $propertyJson}';

Map getRemoteData() {

   Map shapeMap = jsonDecode(shapeJson);

   var shap = Shape.fromJson(shapeMap);
   
   print(shap.shapeName);
   print(shap.property.breadth);
   print(shap.property.width);
   print(shap.property.height);
}


































Stream<T> streamFromFuture<T>(Iterable<Future<T>> futures) async * {
  for(var f in futures)
   yield await f ;
}
