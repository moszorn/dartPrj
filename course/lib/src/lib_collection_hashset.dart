/**
  HashSet class is a hash-table implementation of Set,
  providing fast lookup and updates.

  there are operations such as 'add' , 'contains', 'remove' and 'length' that have a constant time of execution
 */

import 'dart:collection';

class LibCollectionHashSet{
  static void basic(){
    var hset = HashSet.from([3,2,3,1]);
    print(hset); // {1,2,3}
  }
}