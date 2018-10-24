import 'package:errHandler/errHandler.dart' as lab;
import 'dart:async';

main(List<String> arguments) {
  /* lab
      .processFuture()
      .then(successCallback, onError: handError)
      .catchError((onError) => print(onError)); */

  new Future(() => futureTask) //  異步任務的函數
      .then((m) => "futueTask execute result:$m") //   任務執行完後的子任務
      .then((m) => m.length) //  其中m為上個任務執行完後的返回的結果
      .then((m) => printB(m))
      .whenComplete(() => whenTaskCompelete); //  當所有任務完成後的回調函數
}

int futureTask() {
  return 21;
}

void printA(int length) {
  print("printA Text Length:$length");
}

void printB(int length) {
  print("printB Text Length:$length");
}

void whenTaskCompelete() {
  print("Task Complete ");
}

void successCallback(d) {
  print(d);
  throw new Exception("殘念");
}

void handError(e) {
  print(e);
}
