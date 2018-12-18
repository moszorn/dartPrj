import 'dart:collection';

/*
  The Queue class does not reduce the size of an internal collection when 
  it removes elements. Elements in a Queue class can be traversed via a 
  for-each loop or within an Iterator.

  元素加入Queue集合的順序攸關元素在 Queue中的順序
 */

class LibCollectionQueue{
  
  static void run1(){

    var queue = Queue();

    queue.addLast(99);
    queue.add(2);
    queue.add(3);
    queue.addFirst(1);
    print(queue); // {99,2,3,1}

   
    print(queue.length);

    queue.removeLast();// 1
    print(queue);//{99,2,3}
    print(queue.length);

    for(var m in queue){

    }
  }
}