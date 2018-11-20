import 'dart:collection';

/*
The Queue class does not reduce the size of an internal collection when it removes elements. Elements in a Queue class can be traversed via a for-each loop or within an Iterator.
 */

class LibCollectionQueue{
  static void run1(){
    var queue = Queue();
    queue.add(2);
    queue.add(3);
    queue.addFirst(1);
    print(queue); // {1,2,3}

    queue.removeLast();
    print(queue);//{1,2}

    queue.forEach(print);
  }
}