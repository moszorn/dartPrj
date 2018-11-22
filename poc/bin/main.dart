

import 'dart:async';
import 'dart:math' as math;
import 'package:poc/poc.dart' as poc;

import 'dart:io';
import 'dart:convert';

/*
   Windows: pub.bat run poc:main.dart
   Linux: pub run poc:main.dart

   {void onListen(),
      void onPause(),
      void onResume(),
      onCancel(),
      bool sync: false}

 */
main(List<String> arguments) async{

   
  StreamSubscription subcriber = connect().listen((data)=> print('receive $data'));
      
  Future.doWhile(() async {

    await Future.delayed(Duration(seconds: math.Random().nextInt(10)));
    //TODO 

  });





}

Stream connect() {

  Function onListener = ()=> print('開始'), 
            onPause = ()=> print('暫停'), 
            onResume = ()=>print('繼續'), 
            onCancel = ()=>print('取消');
   
    StreamController ctrl = StreamController(
      onListen: onListener,
      onPause: onPause,
      onResume: onResume,
      onCancel: onCancel, sync: false);

    int i = 0;
    int delay_time = 0;
    Future.doWhile(() async{
       ctrl.add(i);
       delay_time = math.Random().nextInt(5);
       await Future.delayed(Duration(seconds: delay_time ));
      
       if(i++ == 100){
         ctrl.close();
       }
        return i < 10;
    });

    return ctrl.stream;
}































Stream<T> streamFromFuture<T>(Iterable<Future<T>> futures) async * {
  for(var f in futures)
   yield await f ;
}
