/*
 Set cannot contain identical elements.
 Set does not allow indexed access to an element in the collection. 
 only through iterator and for-each loop methods

 The Set factory creates the instance of LinkedHashSet .

  Dart 集合(Set) { ... }
  Dart 集合(Set) 不允許重覆的元素
  Dart 集合(Set) 沒有索引取值的概念,所有取值都是透過 iterator
 */

class LibCollectionSet {
  static void run1(){
    var a = Set.from([2,3,null,5,2,null,4]); //2 is duplicated , Set 最多只會包含一個 null 元素
    print(a);// {2,3,null,5,4}

    a.forEach((f)=> print(f));
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
    print(a.difference(b));//A與B差在 A多3    {3}
    print(b.difference(a));//B與A差在 B多5跟6 {5,6}
  }

  static void refSetDiff(){
    var set1 = Set();
    set1.add(ModelForSet('1'));
  }

  static void refSetFold(){

    var set1 = Set();
    
    set1.add(ModelForSet('A',1));
    set1.add(ModelForSet('B',3));
    set1.add(ModelForSet('C',4));
    set1.add(ModelForSet('D',5));
    set1.add(ModelForSet('E'));

   var modelForSet_sum =  set1.fold(ModelForSet('',0), (pre,cur)=> ModelForSet(pre.name + cur.name , pre.sum + cur.sum));

    print('將 Set內的物件(reference type)項目合併成為一個項目');
    print(set1);// {A1, B3, C4, D5, E0}
    print(modelForSet_sum.name);//ABCDE
    print(modelForSet_sum.sum);//13
  }

}
/*
{ }  set （集合)
A∩B  intersection
A∪B  union
A⊆B  subset

 */

class ModelForSet {
  String name;
  int sum;
  ModelForSet(this.name,[sum = 0]);

  String toString() => name+sum.toString();

  // Set集合中儲存的是 ref type , 且
  //要在Set collection中使用  intersection , union , subset  
  //記得實作 operatro == 和 hashCode  屬性
  operator ==(other) => other is ModelForSet && name == other.name;
  int get hashCode => name.hashCode;

}