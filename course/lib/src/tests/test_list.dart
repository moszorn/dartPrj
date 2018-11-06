import 'package:test/test.dart';

testList(){

  // 使用 List 构造函数
var vegetables = new List();

// 使用 list 字符字面量 创建 List
var fruits = ['apples', 'oranges'];

// 添加到 list 中
fruits.add('kiwis');

// 一次添加多个项到 list 中
fruits.addAll(['grapes', 'bananas']);

// 查询 list 的长度
assert(fruits.length == 5);

// 删除一个项
var appleIndex = fruits.indexOf('apples');
fruits.removeAt(appleIndex);
assert(fruits.length == 4);

// 删除 list 中的所有项
fruits.clear();
assert(fruits.length == 0);


var fruitList = ['apples', 'oranges'];

// 通过索引访问 list 中的对象
assert(fruitList[0] == 'apples');

// 查找 list 中是否包含该对象
assert(fruitList.indexOf('apples') == 0);

}

testListGeneric(){
  // 这个 list 应该只包含 String 对象
  var fruits = new List<String>();

  fruits.add('apples');
  var fruit = fruits[0];
  assert(fruit is String);

  // 将有一个静态分析警告， num 不是一个 String
  //fruits.add(5);  // BAD: 在检测模式（Checked mode）下会抛出异常。
}