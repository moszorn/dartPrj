import 'dart:async';

//使用非同步簡潔語法

Future usesAwait(Future lager) async {
  print(await lager);
}

Future asyncError() async {
  throw 'Error';
}

Future asyncValue() async => 'value';

Future afterTwoThings(Future first, Future second) async{
 // return Future.await([first,second]);
}












































































