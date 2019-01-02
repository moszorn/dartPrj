import 'package:course/course.dart';
import 'dart:io';
import 'package:http/http.dart' show Client;
import 'dart:async';
import 'dart:convert';
/*
 pub.bat run course:main.dart
 */
main(List<String> arguments) {
  
  //LibOo.car_extend_generic_function();

  runthis();
}



 runthis() async{

   Client httpClient = Client();

   final _root = 'https://hacker-news.firebaseio.com/v0';

    final response = await httpClient.get('$_root/topstories.json');

    print(response.runtimeType);


    final ids = json.decode(response.body);

    print(ids.runtimeType);


    final _ids = ids.cast<int>();

    print(_ids.runtimeType);




}