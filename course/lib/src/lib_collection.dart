import 'dart:io';


class _LibItem {
  String name;
  dynamic value;
  _LibItem(this.name,this.value);
}


class LibCollection{

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
      print(map1['3']);//third

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

