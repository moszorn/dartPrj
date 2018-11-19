import 'dart:async';
import 'dart:io';

///透過 course.dart 引入 lib/src 下的package
import 'package:course/course.dart';

/*
The call() method is special, in that anyone who defines a call() method is presumed 
to emulate a function. This allows us to use instances of WannabeFunction as if they were functions that take two integer arguments and return an integer
 */
class WannabeFunction {
  call(String a, String b) => '$a $b';
}

main(List<String> args) async {
  //Dart 語言中為了能夠讓建構子函數一樣能夠被調用，可以實現call()方法
  //var wf = WannabeFunction();
  //var out = wf('hi', 'zorn');
  //print(wf('hi', 'zorn'));

  //Error: Getter not found: '$out'
  // print($out);

  /******************************************************************* */

  //Utils.doRepeatJobByPeriod(Duration(seconds: 1), (i)=> print('do job $i'), 5 );

  //LibConsole.clearScreen();
  //LibConsole.argHandlerForRadFileWithLineNumber(args);
  //LibConsole.stdinPipe2Stdout();
  //LibCollection.List2Map();
  //LibCollection.map1();
  //LibCollection.aboutMap2();
  //LibCollection.dynamicMap();

  //LibFile.fileInCurrentDirectoryMap();
  //LibFile.fileInCurrentDirList();
  //LibFile.checkSpecifiedDirectory();
  //LibFile.listenFileRead();
  //LibFile.writeLog();

  //txtfile.txt 必須置與 main.dart同一個目錄
  //LibFile.readAsString();
  //LibFile.readAsLines();
  //LibFile.readAsBytes();
  //LibFile.readRaiseError();

  //txtfile.txt 必須置與 main.dart同一個目錄
  //LibFile.readFile('txtfile.txt');
  //LibFile.readFile('../.gitignore');
  //LibFile.readFile('../main');
  //LibFile.processFileException();
  //LibFile.readFileAsync();

  //LibConvert.j2();
  //LibConvert.toJ();
  //LibConvert.u8decode();
  //LibConvert.utf2dart();
  //LibConvert.d2utf();
  //LibHandle.handleErr();
  //LibHandle.handleErrAfterSuccess();
  //LibHandle.chainHandle();
  //LibCommonSense.aboutEnum();
  //LibCommonSense.characterType();
  //LibCommonSense.aboutRadix();
  //LibCommonSense.about_runes();
  //LibCommonSense.characterType();
  //lib_startHttpServer();
  //lib_httpServerUp();
  //lib_httpServerSocket();
  //lib_OnlyPostHttpServer();
  //LibHttp2.runServer8888();
  //LibHttp2.runServer8889();
  //LibHttpClient.clientGet();

  //LibCollectionComparable.sortUseComparable();
  //LibCollectionComparable.sortUseComparator();


  //LibFuture.loadStringBlock();
  //LibFuture.loadStringNonBlock();
  //LibFuture.waitAllFuture();

  //LibStream.awaitForStream();
  //LibStream.listenStream();
  //LibStream.streamMerge();
  //LibStream.streamCounter();
  //LibStream.asyncErr();
  //LibStream.line();
  //LibStream.periodSimpleJob();
  // LibStream.periodPowJob();
  //LibStream.map();
  //LibStream.expand();
  //LibStream.writeFile();
  //LibStream.listenReadStream();
  //LibStream.asBroadcastStream();
  //LibStream.readFile();
  //LibStream.counterBydelayStream();
  //LibStream.streamFromIterable();
  //LibStream.subSetsOfStramData();
  //LibStream.transformStream();
  //LibStream.streamTransform2();
  //LibStream.validateStream();
  //LibStream.singleValueFromStream();
  //LibStream.streamSubscriptionFromListen();
  //LibStream.unsubscribe();

  //LibStream2.future2Stream();
  //LibStream2.iterable2Stream();
  //LibStream2.periodStream();
  //LibStream2.streamTransfomation();

  //LibStreamController.entry1();
    //LibStreamController.entry2();
 //LibStreamController.streamView();



  //LibFuture.streamFromFutures();

  //LibOverwriteHashCode.use();

  /*
     var libFun = LibFunction(lib_sortFun);
     var list = <int>[7,2,5,8,1,12,4];
     libFun.sortIntList(list);
     print(list);
     */

  //LibFuture.chainFuture();
  //LibFuture.getherFutureResult();

  //LibTimer.streamTimer();
  //LibStream.streamProject();

   //StreamApplication();
}
