import 'dart:collection';
import 'dart:math' as math;


  //If the standart implementation of the List class is not enough, you can create your own implementation ; just
  // extend the 'ListBase' class to align with your needs .
  class NewList<E> extends ListBase {

    final List<E> _elements;

    NewList(): _elements = List<E>();

      @override
      int get length => _elements.length;

      void set length(int len){
        _elements.length = len;
      }  

      @override
      operator [](int index) {
        return _elements[index];
      }

      @override
      void operator []=(int index, value) {
         _elements[index]=value;
      }      
  }


//透過 asMap 由 List轉換來的 map不可異動
class LibCollectionCustomList{

  static void custom1(){
    NewList<int> o = NewList();
    o.add(1);
    o.add(2);
    o.add(3);    
    o.forEach(print);
  }

  static void list2Map(){
    
    var list = ['a','b','c','d'];
    var map = list.asMap();
    map.forEach((k,v){
      print('$k = $v');
    });

    try{

        //The asMap method of the List class returns a Map view that cannot be modified.
        map[2]='z';

    } on UnsupportedError catch (err){
      print(err.message);//Cannot modify unmodifiable map
    }

  }

static void randomShuffle(){
  
  var list = List.from([1,2,3,4,5,6]);
  print(list);
  var seed = DateTime.now().millisecondsSinceEpoch;

  //create instance of generator
  var random = math.Random(seed);

  //rshuffle - re-arrange elements in list
  list.shuffle(random);
  print(list);
}

}