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

  //lib_startHttpServer();
  //lib_httpServerUp();
  //lib_httpServerSocket();
  //lib_OnlyPostHttpServer();

  //LibHttp2.runServer8888();

  // http://127.0.0.1:8989/libhttp2
  LibHttp2.runServer8888();

  
}
