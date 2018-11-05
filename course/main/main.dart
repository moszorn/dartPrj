////透過 course.dart 引入 lib/src 下的package
import 'package:course/course.dart';

class WannabeFunction {
  call(String a, String b) => '$a $b';
}

main(List<String> args) async {
  //Dart 語言中為了能夠讓類像函數一樣能夠被調用，可以實現call()方法
  var wf = WannabeFunction();
  var out = wf('hi', 'zorn');
  print(wf('hi', 'zorn'));

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

  //txtfile.txt 必須置與 main.dart同一個目錄
  //LibFile.readFile('txtfile.txt');
  //LibFile.readFile('../.gitignore');
  //LibFile.readFile('../main');

  //LibHandle.handleErr();
  //LibHandle.handleErrAfterSuccess();
  //LibHandle.chainHandle();
  //LibCommonSense.aboutEnum();
  //LibCommonSense.characterType();
  //LibCommonSense.aboutRadix();

  //lib_startHttpServer();
  //lib_httpServerUp();
  //lib_httpServerSocket();
  //lib_OnlyPostHttpServer();

  //LibFuture.loadStringBlock();
  //LibFuture.loadStringNonBlock();

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
  //LibStream.validateStream();
  //LibStream.singleValueFromStream();
  //LibStream.streamSubscriptionFromListen();
  //LibStream.unsubscribe();

  /*
     var libFun = LibFunction(lib_sortFun);
     var list = <int>[7,2,5,8,1,12,4];
     libFun.sortIntList(list);
     print(list);
     */
  
}

void poc() {
 
}
