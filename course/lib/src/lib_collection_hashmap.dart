import 'dart:collection';

/** 
  HashMap class is hash-table-based implementation of Map 

  providing fast lookup and updates .

  maps the keys and values without guaranteeing the order of elements.
*/

class LibCollectionHashMap {
    static void run1(){
       var map =  HashMap.fromIterables([2, 3, 1], ['2', '3', '1']);
     print(map);   // => {2: 2, 1: 1, 3: 3}
    }
}