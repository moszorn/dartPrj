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

  fetchJson();
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

Future<void> fetchJson() async{
   Client httpClient = Client();
  final String url = 'https://hacker-news.firebaseio.com/v0/item/18831796.json';
  final response = await httpClient.get(url);
  final rs = json.decode(response.body);
  print(rs.runtimeType);

  final model = ItemModel.fromJson(rs);
  print(model.kids.runtimeType);//<dynamic, int>
  print(model.kids[0]);
  print(model.kids[0].runtimeType);//int
}
class ItemModel {
  final int descendants;
  final int id;
  final int score;
  final int time;
  final List<int> kids;
  final String by;
  final String title;
  final String type;
  final String url;

  //代表由Json 轉成 model
  ItemModel.fromJson(Map<String, dynamic> parsedJson):
    descendants = parsedJson['descendants'],
    id = parsedJson['id'],
    score = parsedJson['score'],
    time = parsedJson['time'],
    by = parsedJson['by'],
    title = parsedJson['title'],
    type = parsedJson['type'],
    url = parsedJson['url'],
    kids  = parsedJson['kids'].cast<int>();
}

/**
 * 
 * name in ths case
 * setting up
 * change in the next lexture\\\
 * Expand(ViewList.build)
 * How ever product
 * pass refjljljgodojjjfojadd Producnt de.etePdocuent
 * pproducrs
 * I will can see dynamicfgjsi;klkjojg
 *stateManager goal
 * 
 * 
 * 
 * 
 */