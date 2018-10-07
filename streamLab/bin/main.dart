import 'dart:convert';

import 'package:streamLab/streamBasic.dart' as basic;
import 'package:streamLab/streamErr.dart' as err;
import 'dart:async';
import 'dart:io';
import 'dart:math';

import "package:streamLab/customExistStream.dart" as customExistStream;
import "package:streamLab/asynGenerator.dart" as gen;

main(List<String> arguments) {
  //run1();
  //run2();
  //run3();
  //run4();
  //run5();
  //run6();
  // run7();
  //run8();
  run0(499).then(print);
  print('---------------------');
}

Future<int> run0(x) async {
  print(x);
  return x + 1;
}

void run1() async {
  //Stream<int>
  var stream = basic.countStream(10);

  var sum = await basic.sumStream(stream);
  print(sum); //1+2+3+4+5+6+7+8+9+10
}

void run2() async {
  Stream<int> stream = err.countStream(10);
  int sum = await err.sumStream(stream);
  print(sum);
}

void run3() async {
  Stream<String> src = customExistStream.source();
  Stream<String> result = customExistStream.lines(src);
  result.forEach(stdout.writeln);
}

void run4() async {
/*   Stream<int> counter =
      Stream<int>.periodic(Duration(seconds: 1), (x) => x).take(10);
  counter.forEach(stdout.writeln); */
  Stream<int>.periodic(Duration(seconds: 1), (x) => x)
      .take(10)
      .forEach(stdout.writeln);
}

void run5() async {
  /* 
    To transform the stream events, you can invoke a transforming method 
    such as map() on the stream before listening to it. 
    The method returns a new stream.  
   */
  Stream<int>.periodic(Duration(seconds: 1), (x) => x)
      .take(10)
      .map((x) => x * 2)
      .forEach(stdout.writeln);
}

void run6() async {
  Stream<int>.periodic(Duration(seconds: 1), (x) => x)
      .where((x) => x.isEven)
      .expand((x) => [x, pow(x, x)])
      .take(10)
      .forEach(stdout.writeln);
}

void run7() async {
  Stream<List<int>> content = File('筆記').openRead();
  await content
      .transform(utf8.decoder)
      .transform(LineSplitter())
      .forEach(stdout.writeln);
}

void run8() async {
  //每5秒鐘產出一個int
  gen.timeCounter(Duration(seconds: 5), 3).forEach(stdout.write);
}

void run9() async {
  //每5秒鐘產出一個int
  gen.timeCounter(Duration(seconds: 5), 3).forEach(stdout.write);
}
