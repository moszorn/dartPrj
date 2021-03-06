import 'dart:io';
import 'dart:convert';

class _LibItem {
  String name;
  dynamic value;
  _LibItem(this.name,this.value);
}


class LibCollection{


 static mapDeclaration(){

    var map2 = {
        "a": "AAA",
        "b": "BBB",
        "c:": "CCC",
    };

    var map3 = <String,String>{
        "a": "AAA",
        "b": "BBB",
        "c:": "CCC",
    };

    var map4 = Map();
    map4["a"] = "AAA";
    map4["b"] = "BBB";
    map4["c"] = "CCC";

    print('----------------------------${map2.runtimeType}--------------');//_InternalLinkedHashMap<String, String>
    
    print('----------------------------${map3.runtimeType}--------------');//_InternalLinkedHashMap<String, String>
    
    print('----------------------------${map4.runtimeType}--------------');//_InternalLinkedHashMap<dynamic, dynamic>
    
  }

  static List<_LibItem> ListGenerate(){
    final items_count = 10;
    return List.generate(items_count, (i)=> _LibItem('Item ${i.toString()}', i ));
  }

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



  /* 定義:
 Map is an object that associates keys and values. 
 Both keys and values can be any type of object .
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
    print(map1.runtimeType);// _InternalLinkedHashMap<String,String>
    print(map2.runtimeType);//  _InternalLinkedHashMap<int, Object>
    print('-------------------------------------------') ;
    print(map2[0]);//null
    print(map2[2].runtimeType);//String
    print(map2[3].runtimeType);//int
    print(map2[4].runtimeType);//bool
    print('-------------------------------------------') ;
  }

  //比對 aboutMap1() , 當宣告 Map時 , 用 map literal 宣告比用 Map() 還高效率,
  // 除非元素將會要包含不確定的型別 dynamic
  static aboutMap2(){
    var map1 = Map();
      map1['1']='first';
      map1['2']='second';
      map1['3']='third';
      print(map1['3']);//third
 print('--------------------${map1.runtimeType}-----------------------') ;//_InternalLinkedHashMap<dynamic, dynamic>
    

   var map2 = Map();
    map2[2]=true;
    map2[10]='hello';
    map2[999]=23;
    print('--------------------${map2.runtimeType}-----------------------') ;//_InternalLinkedHashMap<dynamic, dynamic>
    print('map length: ${map2.length}');// 3
    print(map2[0]);//null
    print(map2[2].runtimeType);//String
    print(map2[10].runtimeType);//int
    print(map2[999].runtimeType);//bool
    print('-------------------------------------------') ;
    //associtative array
    var t = {"first": "partridge"};
    print(t["first"]); //partridge
    print('map length : ${t.length}');//1
    print(t[0]); //null
    print('-------------------------------------------') ;
  }

  static dynamicMap(){
    var name = <String>["name","age","location"];
    var map = {};
    for(var n in name)
     map[n]='on the fly $n';
    print('----------------------------${map.runtimeType}--------------');//_InternalLinkedHashMap<dynamic, dynamic>
    print(map[0]);// null
    print(map["name"]); // on the fly name
    print(map["age"]); // on the fly age
    print(map["location"]); // on the fly location
  }

  static map1(){
    var map = <String,String>{"a":"aa","b":"bb","c":"cc"};
    map.forEach((k,v){
      stdout.writeln("map1 -> $k $v");
    });
  }

  static jsonToMap() {

    final String _json='''
    {
      "name": "IamA",
      "age": 12,
      "isOk": true
    }
    ''';

     Map json = jsonDecode(_json);
     ModelxyZ a = ModelxyZ.fromJson(json);
    print(a);

  }
 

  /**
   List : 
      an ordered collection that supports indexed access to elements
      allows duplicate elements
   Set :
      each elements can occue only once
   Queue : 
      can be manipulated at both ends
   Map : 
      Key-Value pairs collection where each element is accessible by a  UNIQUE key .
   */

  static void fixedLengthList() {

    // 透過 List建構子指定為固定長度陣列 , List(n)
     //建立一個固定長度的 collection
    //長度一被確定後就無法在變動陣列長度
    var t = List(3);
    try {
            //固定長度陣列只能用索引的方式填值, 以下add是錯誤的
            t.add(1); //exception

           //固定長度陣列也不允許清除 clear
           t.clear(); //exception

          t[0] = 1;//pass
          t[1] = 1;//pass
          t[2] = 1;//pass
          t[3] = 1; //exception
            
    } on UnsupportedError catch(e){
      print(e );
    }
  }
}

class ModelxyZ {

  String name;
  int age;
  bool isOk;

  ModelxyZ.fromJson(Map<String, dynamic> json):
  name = json['name'], 
   age = json['age'], 
  isOk = json['isOk'];

  String toString(){
    return "$name , age=$age, isOk=$isOk";
  }

}