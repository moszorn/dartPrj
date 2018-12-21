import "dart:async";

Future<String> _processFail() async {
  await Future.delayed(Duration(seconds: 3));
  throw new Exception('process Faile');
}

Future<String> _processSuccess() async {
  await Future.delayed(Duration(seconds:3));
  return "process success";
}

_successCallback(e){
  print('$e 已經執行成功');
}

_failCallback(e) {
   print('$e 已經執行成功');
  throw new Exception('失敗');
}

_handleErrorAfterSuccess(e){
  print('$e 成功後的執行發生錯誤');
}

_handleError(e) {
  print('  $e ');
}

/* 有關error handler 仍不正確 ,需確認官網*/
class LibHandle {
 
   static void handleErr(){
     //成功執行,不會觸發 exception
    _processSuccess()
    .then( _successCallback , onError: _handleErrorAfterSuccess)
    .catchError(_handleError);
    
  }

  static void handleErrAfterSuccess(){
    //成功執行,但在執行成功回呼時丟出 exception
    _processSuccess()
    .then( _failCallback , onError: _handleErrorAfterSuccess)
    .catchError(_handleError);
  }

  static void chainHandle(){

     new Future(() => 'a') //  異步任務的函數
      .then((a) => '$a b') //   任務執行完後的子任務
      .then((ab) => "$ab c") //  其中m為上個任務執行完後的返回的結果
      .then((abc) => print(abc))
      .whenComplete(() => print('all done')); //  當所有任務完成後的回調函數

  }


}