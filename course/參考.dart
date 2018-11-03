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




























/*   
  const List<int> l = <int>[1,2,3,4,5];
  Error below , const can`t be change
  l[0]=9; 
*/


/* 
    Translator t1 = const Translator(19);

    Translator t2 = const Translator(19);

    print(t1 == t2);// true


    Translator t3 =  Translator(19);

    Translator t4 =  Translator(19);

    print(t3 == t4);// false
*/
