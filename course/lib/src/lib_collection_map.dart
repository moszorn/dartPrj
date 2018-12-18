/* 
  Dart Map   { k1:v1, k2:v2, k3:v3, .. } 
  Dart Map 元素不允許重覆key ,但允許eky值為 null
  Dart Map 是不可列舉型集合,但提供對其keys與 values進行列舉的屬性 
   
  ( 
    Map class is not a subtype of the Iterator
     (IteratorBase or even IteratorMixin, but provides seprarte iterators for Keys and Values
  )

  對於 Map集合中為參考型別進行操作時,參考型別必需實作 equals operator , hashCode

  A key of the Map class must implement the equals operator and the hashCode method.
*/

class LibCollectionMap {

  static void run0() {
    var map = Map.fromIterable([1,2,3,4]);
    print(map); //{1: 1, 2: 2, 3: 3, 4: 4}
  }
  static void run1(){
      var map = Map.fromIterables(['a',14,'c',null,'e'], [10,'R',30,40,null]);
     print(map); // {a: 10, 14: R, c: 30, null: 40, e: null}
  }

  static void putIfAbsent(){
    var map =  Map.fromIterables([3, 2, 1], ['3', '2', '1']);
     print(map); // => {3: 3, 2: 2, 1: 1}

     //This method adds key-value pairs only if the key is absent. 
     map.putIfAbsent(3, () => '33');
     map.putIfAbsent(4, () => '4');
     print(map);
     // => {3: 3, 2: 2, 1: 1, 4: 4}
  }

  static void putIfAbsent2(){

    //注意這裡宣告了 Map key 為 dynamic , key也為 dynamic
    //若key,與 value 不是Dynamic,而是以具體型別宣告,則底下 putIfAbsent(Model,Modle)就會報錯 
     var map = Map.fromIterables([1,2,3,'s'], [-1,3,4, "g"]);

     //假如Map 不存在 hello Model這個鍵值, Map就會加入這組 map
     map.putIfAbsent(Model('hello'), () => Model('world'));
  }

  static void contains(){
    var map =  Map.fromIterables([3, 2, 1], ['3', '2', '1']);
     print(map);     // => {3: 3, 2: 2, 1: 1}
     print(map.containsKey(1));     // => true
     print(map.containsKey(5));     // => false
     print(map.containsValue('2'));     // => true
     print(map.containsValue('55'));     // => false
  }
}



class Model {
  String name;
  Model(this.name);
  bool operator ==(o)=> o is Model && name == o.name;
  int get hashCode => name.hashCode;
  String toString() => this.name;
}