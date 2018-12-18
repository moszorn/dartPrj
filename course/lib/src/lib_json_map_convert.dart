import 'dart:async';
import 'dart:convert';


/*

Json to Dart :  jsonDecode

Dart to Json :  jsonEncode
  Only objects of type int, double, String, bool, null, List, or Map (with string keys) 
  are directly encodable into JSON. List and Map objects are encoded recursively.
 */


class LibJsonMapConvert{

  static void json2Map() {
      var jsonString = '''
        [
          {"score": 40},
          {"score": 80}
        ]
      ''';

      var scores = jsonDecode(jsonString);
      bool isList = ( scores is List);
      var isMap = scores[0] is Map ;

      print('scores is type List : ${isList}');      
      print('scores is map : ${isMap}');
  }

  static void map2Json() {
    /*
    Only objects of type int, double, String, bool, null, List, or Map (with string keys) 
  are directly encodable into JSON. List and Map objects are encoded recursively.
     */
    var mapCol = [
      {'string1': true , 'string2': 12 ,  'string3': '2018-12-12' , 'string4': [1,3,4,2,1,2,3,7]},
      {'string1': true , 'string2': 12 ,  'string3': '2018-12-12' , 'string4': {"x": 33 , "y": ["a","b","c"]}},
      {'string1': true , 'string2': 12 ,  'string3': '2018-12-12' , 'string4': null},
      {'string1': true , 'string2': 12 ,  'string3': '2018-12-12' , 'string4': null},
      {'string1': true , 'string2': 12 ,  'string3': '2018-12-12' , 'string4': null}
    ];

    var jsonText = jsonEncode((mapCol));
    print(jsonText);
  }


   static void json2MapUseFun() {
      var jsonString = '''
        [
          {"score": 40},
          {"score": 80}
        ]
      ''';

     
      var scores = jsonDecode(jsonString);
      bool isList = ( scores is List);
      var isMap = scores[0] is Map ;

      print('scores is type List : ${isList}');      
      print('scores is map : ${isMap}');
      print(scores);
  }

  static void map2JsonUseFun() {
    /*
    Only objects of type int, double, String, bool, null, List, or Map (with string keys) 
  are directly encodable into JSON. List and Map objects are encoded recursively.
     */
    var mapCol = [
      {'string1': true , 'string2': 12 ,  'string3': '2018-12-12' , 'string4': [1,3,4,2,1,2,3,7]},
      {'string1': true , 'string2': 12 ,  'string3': '2018-12-12' , 'string4': {"x": 33 , "y": ["a","b","c"]}},
      {'string1': true , 'string2': 12 ,  'string3': '2018-12-12' , 'string4': null},
      {'string1': true , 'string2': 12 ,  'string3': '2018-12-12' , 'string4': null},
      {'string1': true , 'string2': 12 ,  'string3': '2018-12-12' , 'string4': null}
    ];

    var jsonText = jsonEncode(mapCol);
    print(jsonText);
  }
  
}