/* 
   Map class is a collection of Key-value pair ,
   key has a reference to only one value which does`t allow duplicate keys .

  Map class is not a subtype of the Iterator (IteratorBase or even IteratorMixin)
  but  provides seprarte iterators for Keys and Values


  The Map class allows you to use the null value as a key.


  A key of the Map class must implement the equals operator and the hashCode method.
*/

class LibCollectionMap {
  static void run1(){
    var map = new Map.fromIterables([3, 2, 1], ['3', '2', '1']);
     print(map); // {3: 3, 2: 2, 1: 1}
  }

  static void putIfAbsent(){
    var map = new Map.fromIterables([3, 2, 1], ['3', '2', '1']);
     print(map); // => {3: 3, 2: 2, 1: 1}

     //This method adds key-value pairs only if the key is absent. 
     map.putIfAbsent(3, () => '33');
     map.putIfAbsent(4, () => '4');
     print(map);
     // => {3: 3, 2: 2, 1: 1, 4: 4}
  }

  static void contains(){
    var map = new Map.fromIterables([3, 2, 1], ['3', '2', '1']);
     print(map);     // => {3: 3, 2: 2, 1: 1}
     print(map.containsKey(1));     // => true
     print(map.containsKey(5));     // => false
     print(map.containsValue('2'));     // => true
     print(map.containsValue('55'));     // => false
  }
}