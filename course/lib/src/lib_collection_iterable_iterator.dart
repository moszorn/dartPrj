






/*
  IterableBase , IterableMixin class 實作 Iterator interface , if you plan to create your own implementation of the Iterable interface , 
  you need to extend one of the them.

  常用 Iterable 介面: 
    length:
    isEmpty:
    isNotEmpty:
    first:
    last:
    single:
    iterator:
 */

void lastWhere(){
  List colors = ['red','green','blue'];

  //orElse call back : 假如找沒, 回傳 orElse 結果,
  // 假如找沒 , 且沒有 orElse 丟出 StateError
  var result = colors.lastWhere((color)=> color != 'orange' , orElse: ()=> '');
}

void firstWhere() {
   List colors = ['red','green','blue'];
    var result = colors.firstWhere((color)=> color == 'orange', orElse:()=>'');
 }

 void singleWhere() {

   List colors = ['red','green','blue'];
   // If the collection is empty or more than one element matches, then it throws StateError. 
    var result = colors.singleWhere((color)=> color == 'orange', orElse:()=>'');

 }

 //elementAt() : If the collection does not support ordering, then the result of calling elementAt may be any element.

 /**
   following list includes methods to create a new collection from the original one; 
   all of them return Lazy Iterable results;
  */

//returns new collections by expanding each element of the original one to zero or more elements.
void expand(){
   List colors = ['red','green','blue'];
   colors.expand((color){
     return color == 'red' ? ['orange', 'red','yellow'] : [color];
   });
}

//create a new collection of elements based on the elements from the original collection that are transformed with specified function.
void map(){
   List colors = ['red','green','blue'];
  List<int> result = colors.map((color){
     if(color == 'green') return 1;
     if(color == 'blue') return 2;
     return 0;
   });
}

//return an Iterable collection with a specified number of elements from the original collection
void take(){
  var nums = [1,2,3,4,5,6];
  nums.take(7); // [1,2,3,4,5,6]
}

//return an Iterable collection that stops once the test is not satisfied anymore
void takeWhile(){
  var nums = [1,2,3,4,5,6];
  nums.takeWhile((element)=> element < 5); //[1,2,3,4]
}

//return an Iterable collection that skips the specifies number of initial elements.Comparable
void skip(){
  var nums = [1,2,3,4,5,6];
  nums.skip(4); //[5,6]
}

//return an Iterable collection that skips the elements while the test is satisfied 
void skipWhile(){
  var nums = [1,2,3,4,5,6];
  nums.skipWhile((element)=> element <=4); //[5,6]
}

void toList(){
  List nums = [1, 2, 3];

  //if the growable is false , return fixed length list
  nums.toList(growable: false); //[1,2,3]
}


// create a set that contains the elements of the original collection ,
//it ignores the duplicate elements
void toSet(){
  List nums = [1, 2, 1];
       print(nums.toSet());//  {1,2}
}


/*
 Reducing a collection
 */

//reduces the collection to a single value by iteratively （迭代) combining the elements of the collection using the provided function
//if the collection is empty , thie results in StateError .
void reduce(){
  var nums = [1,2,3];
  nums.reduce((sum,element)=> sum + element); //6
}

//reduce the collection to a single value by iteratively combining each element fo the collection with an existing vaue using th  specified function
void fold(){
  var nums = [1,2,3];
  // have to specify the initial value and aggregation function.
  nums.fold(0 , (acc, element) => acc + element); //6
}

void lazyIterable(){
  var nums = [1,2,3];

  print('Get Iterble for $nums');
  Iterable<int> iterable = nums.where((int i){
    print('Fetch $i');
    return i.isOdd;
  });
  print('Start fetching');
   //上面的 where 實際會在開始 forWach 時才求值
  iterable.forEach((int i){
    print("Received $i");
  });
}


//Always initialize the Iterator with the moveNext method to prevent unpredictable results.
void iteratorJob1(){
  print('lib_collection_iterable_iterator.dart - iteratorJob1()');
  List<String> colors = ['red','green','blue'];
  Iterator<String> iter = colors.iterator;
  do{
    print(iter.current);
  }while(iter.moveNext());// Error 
}

void iteratorJob2(){
  var colors = ['green','red','blue'];
  var iterator = colors.iterator;
  //Always initialize the Iterator with the moveNext method to prevent unpredictable results.
  while(iterator.moveNext())
    print(iterator.current);
}