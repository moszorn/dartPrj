import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'lib_console.dart';

//沒有 async
Future<String> _loadString2() {
  return Future.delayed(Duration(seconds: 2))
      .then((_) => '(loadString2) hello world');
}

Future<String> _loadString1() async {
  await Future.delayed(Duration(seconds: 2));
  return '(loadString1) hello world';
}

class LibFuture {

  static makeFuture(){
     Future calc = Future(()=>"hi");
     calc.then(print);
  }

  static makeMicroTask(){
    /*
    If the result of computation throws, 
    the returned Future is completed with the error. 
    If computation creates another Future, 
    the current one will wait until the new Future is completed 
    and will then be completed with the same result.
     */
    Future calc = Future.microtask(()=>'hi');
    calc.then(print);
  }

  void immediatelyFuture(){
    /*
     為何要有 future immediately? 
     The reason for this is that the Future immediately 
     calls the computation function. The result of the 
     computation will be returned in the next event-loop iteration.
     */
    Future calc = Future.sync(()=>'hi');
    calc.then(print);
  }

 void futureError(){
   try{
     throw new Error();
   } on Error catch(ex, stackTrace){
     Future er = Future.error(ex,stackTrace);
     er.catchError((err,stack)=>print(err));
   }
 }


  static Future<Function> closureFun(int x) async {
    return (int y) async => x + y;
  }

  static void loadStringNonBlock() {
    LibConsole.clearScreen();
    print('[loadStringNonBlock] start load String ');
    _loadString1().then((o) => stdout.writeln('  ' + o));
    _loadString2().then((o) => stdout.writeln('  ' + o));
    print('[loadStringNonBlock] end load String');
  }

  static void loadStringBlock() async {
    LibConsole.clearScreen();
    print('[loadStringBlock] start load String......blocking');
    print('  ' + await _loadString1() + '......blocking');
    print('  ' + await _loadString2());
    print('[loadStringBlock] end load String');
  }

  static void waitAllFuture() {
    Future<void> process1 = asycProcess1();
    Future<void> process2 = asycProcess2();
    Future<void> process3 = asycProcess3();
    Future<List<dynamic>> result = Future.wait([process1, process3, process2]);
    result.then((List values) {
      values.forEach((v) => print(v));
    });
  }

  static Future chainFuture() {
    Function method = () async => Future.value('after do something result\n\n');
    method().then(print);
    stdout.writeln();

    Function expensiveA = () async => Future.value('A');
    Function expensiveB = (v) async => Future.value('$v B');
    Function expensiveC = (v) async => Future.value('$v C');
    Function doSomethingFinal = print;

    expensiveA()
        .then((v) => expensiveB(v))
        .then((v) => expensiveC(v))
        .then((v) => doSomethingFinal(v));
  }

  static getherFutureResult() {
    Function choosBestResponse =
        (List list) => print(list[0] + ' is best result');
    Function handleError = print;

    Future<String> taskA() => Future.value('Result A');
    Future<String> taskB() => Future.value('Result B');
    Future<String> taskC() => Future.value('Result C');

    Future taskD = (() async => Future.value('Result C'))();

    Future.wait([
      taskA(),
      taskB(),
      taskC(),
      (() async => Future.value('Result D'))()
    ])
        .then((List response) => choosBestResponse(response))
        .catchError((e) => handleError(e));
  }

  static streamFromFutures() {
    Future<String> fun1() async {
      await Future.delayed(Duration(seconds: 2));
      return "fun1";
    }

    Future<String> fun2() async {
      await Future.delayed(Duration(seconds: 6));
      return "fun2";
    }

    Future<String> fun3() async {
      await Future.delayed(Duration(seconds: 10));
      return "fun3";
    }

    //List<Future> futures = <Future>[fun1(),fun2(),fun3()];
    Iterable<Future> results = <Future>[
      Future.value("result1"),
      Future.value("result2"),
      Future.value("result3")
    ];
    Iterable<Future> futures = <Future>[fun1(), fun2(), fun3()];

    //報錯:  fromFuture<String>(futures).listen(print);
    fromFutures(futures).listen(print);
  }
}


//使用這個方法,不要宣告回傳型態( fromFutures<String>(ccc) )
//直接用  fromFutures(xxx)
//It’s rare to have an async* function building a stream from nothing. It needs to get its data from somewhere, and most often that somewhere is another stream. 
Stream<T> fromFutures<T>(Iterable<Future<T>> futures) async* {
  for (var future in futures) {
    var result = await future;
    yield result;
  }
}

Future<String> asycProcess1() {
  return Future.delayed(Duration(seconds: 3)).then((_) => ("Process 1 done"));
}

Future<Null> asycProcess2() {
  return Future.delayed(Duration(seconds: 5)).then((_) => null);
}

Future<int> asycProcess3() {
  return Future.delayed(Duration(seconds: 1)).then((_) => 3);
}

Stream<T> streamFromFutures<T>(Iterable<Future<T>> futures) async* {
  for (var future in futures)  
    yield await future;
}
