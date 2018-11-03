import 'dart:io';

class _LibItem {
  String name;
  dynamic value;
  _LibItem(this.name,this.value);
}


class LibCollection{
  static List2Map(){
     final list = <_LibItem> [
       _LibItem('item1', '#f3da3b'),
       _LibItem('item2', '#b39cf1'),
       _LibItem('item3', '#8390ca'),
     ];

     list.asMap().forEach((idx,option){
       stdout.writeln('List2Map -> $idx - ${option.name},${option.value}');
     });
  }



  /*
 Map is an object that associates keys and values. Both keys and values can be any type of object .
 Each key occurs only once .
 */
  static aboutMap(){

    //analyzer infer as _InternalLinkedHashMap<String,String>
     var map1 = {
       'first': 'a',
       'second':'b',
     },

    //只有在索引 2, 3, 4 指定值  _InternalLinkedHashMap<int, Object>
    map2 = {
      2: 'hi',
      3: 32,
      4: true
    };
    print(map1.runtimeType);
    print(map2.runtimeType);
    print('-------------------------------------------') ;
    print(map2[0]);//null
    print(map2[2].runtimeType);//String
    print(map2[3].runtimeType);//int
    print(map2[4].runtimeType);//bool
    print('-------------------------------------------') ;


  }

  static aboutMap2(){
    var map1 = Map();
      map1['1']='first';
      map1['2']='second';
      map1['3']='third';
      print(map1['3']);

   var map2 = Map();
    map2[2]=true;
    map2[10]='hello';
    map2[999]=23;
    print('--------------------${map2.runtimeType}-----------------------') ;
    print('map length: ${map2.length}');
    print(map2[0]);//null
    print(map2[2].runtimeType);//String
    print(map2[10].runtimeType);//int
    print(map2[999].runtimeType);//bool
    print('-------------------------------------------') ;

    //associtative array
    var t = {"first": "partridge"};
    print(t["first"]); 
    print('map length : ${t.length}');
    print(t[0]); //null
    print('-------------------------------------------') ;
  }

  static dynamicMap(){
    var name = <String>["name","age","location"];
    var map = {};
    for(var n in name)
     map[n]='on the fly $n';
    print('----------------------------${map.runtimeType}--------------');
    print(map[0]);
    print(map["name"]);
    print(map["age"]);
    print(map["location"]);
  }

  static map1(){
    var map = <String,String>{"a":"aa","b":"bb","c":"cc"};
    map.forEach((k,v){
      stdout.writeln("map1 -> $k $v");
    });
  }
}