/*
 Set cannot contain identical elements.
 Set does not allow indexed access to an element in the collection. only through iterator and for-each loop methods

 The Set factory creates the instance of LinkedHashSet .
 */

class LibCollectionSet {
  static void run1(){
    var a = Set.from([2,3,null,5,2,null,4]); //2 is duplicated , Set 最多只會包含一個 null 元素
    print(a);// {2,3,null,5,4}
  }

  //Intersection 會回傳內部集合和另一個集合之間的交集 (回傳一個新的Set集合)
  // {1,2,3} ∩ {3,5,6} => 3
  static void intersection(){
    var a = Set.from([3,2,3,1]), b = Set.from([2,1,5,6]);
    print(a.intersection(b)); // {2,1}
  }

  static void union(){
     var a = Set.from([3,2,3,1]), b = Set.from([2,1,5,6]);
    print(a.union(b));//{3,2,1,5,6}
  }

  //  表較集合 Ａ 與集合Ｂ的差別
  //  A與B差在哪
  static void difference(){
    var a = Set.from([3,2,3,1]), b = Set.from([2,1,5,6]);
    print(a.difference(b));//A與B差在 A多個{3}
    print(b.difference(a));//{5,6}
  }
}
/*
{ }  set （集合)
A∩B  intersection
A∪B  union
A⊆B  subset

 */