import 'package:test/test.dart';
import 'dart:io';
// Set 是包含唯一對象的無序集合。 由於 set 中的對象都是沒有順序的，所以無法用位置索引來 訪問裡面的對象。
testSet(){
  stdout.writeln("Set implement  Iterable");

  test('forEach', (){
    var ints = [2,3,4,31,9,22,12,46,74,23];
    var sets = Set();
    sets.addAll(ints);

    var i = 0;
    sets.forEach((value)=> expect(ints[i++] == value,true));
  });
  test('addAll,add,remove',(){

    var ings = Set();
    var ing = <String>['gold','titanium','xenon'];
    ings.addAll(ing);
    expect(ings.length == 3, true);

    //添加一個重複的Object不起作用
    ings.add('gold');
    expect(ings.length == 3, true);

    //刪除一個Object
    ings.remove('gold');
    expect(ings.length == 2, true);

  });

  test('contains,containsAll',(){
    var nums = <num>[12.4,0.7,21.34,8.0];
    var sets = Set();
    sets.addAll(nums);
    
    expect(sets.contains(12.4), true);
    expect(sets.containsAll(nums), true);

    sets.remove(12.4);
    print(sets);
    //移除12.4 , 因此底下為 false
    expect(sets.containsAll(nums), false);
  });

  test('lookup',(){
      var nums = <num>[12.3,44.1,0.4,2.7];
      var sets = Set();
      sets.addAll(nums);

      expect(sets.lookup(44.1) == 44.1 , true);
  });


  test('difference',(){
      var nums = <num>[12.3,44.1,0.4,2.7];
      var set1 = Set(), 
          set2 = Set();
      set1.addAll(nums);
      set2.addAll([0.08,44.1,0.4,2.7]);
      
      //回傳set1差異的項目
      stdout.writeln('set1 compare set2 difference on : ${set1.difference(set2)}');
      stdout.writeln('set2 compare set1 difference on : ${set2.difference(set1)}');
      expect(set1.difference(set2).length == 1 , true);

      set2.clear();
      set2.addAll(nums);
      expect(set1.difference(set2).length == 0 , true);
  });

  test('union',(){
      var evenNums = <int>[1,3,5,7,9],oddNums=[0,2,4,6,8];
      var set1 = Set(), 
          set2 = Set();
      set1.addAll(evenNums);
      set2.addAll(oddNums);
      
      //
      stdout.writeln('odd union even : ${set1.union(set2)}');
      stdout.writeln('even union odd : ${set2.union(set1)}');
      expect(set1.union(set2).length == 10 , true);
  });

  test('union',(){
      var big = <String>['A','B','C','D','E','F'],small=['a','b','C','d','f'];
      var set1 = Set(), 
          set2 = Set();
      set1.addAll(big);
      set2.addAll(small);

      var intersection = set1.intersection(set2);
      
       // 兩個 set 的交集
      stdout.writeln('big intersection small : ${set1.intersection(set2)}');
      stdout.writeln('small intersection big : ${set2.intersection(set1)}');
      expect(intersection.length == 1 , true);
      expect(intersection.contains('C'), true);
  });
}