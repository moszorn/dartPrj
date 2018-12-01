

import 'dart:async';
import 'dart:math' as math;
import 'dart:io';
import 'dart:convert';
import 'package:poc/poc.dart' as poc;



/*
   Windows: pub.bat run poc:main.dart
   Linux: pub run poc:main.dart

   {void onListen(),
      void onPause(),
      void onResume(),
      onCancel(),
      bool sync: false}

 */
void requestHandler(HttpRequest request) async {

   HttpResponse rp = request.response;
   print('server receive request at path ${request.uri.path}');
   if(request.uri.path.contains('/fun1')){     
      print(await request.transform(utf8.decoder).join());
   } else if(request.uri.path.contains('/func2')){

   } else if(request.uri.path.contains('/quit')){
      rp ..headers.contentType = ContentType.text
         ..write('bye bye');
         server.close();
   } else {
      rp ..headers.contentType = ContentType.text
         ..write('Home page');
   }
}

  HttpServer server; 
  const port = 9819;

main(List<String> arguments) async{
   
  //只有在c 為 null時,才賦值 d
  String c,d='d',e = c??d;
  print(e);

  //只有在 f 為 null時 , 才賦值g
  String f,g = 'f is null';
  f ??= g;
  print(g);

  // 只有j不為 null時 , h才會被賦值 (i.toString()), 否則 h 仍然是 null
  String j ;
  String h = j?.toString();
  print(h);





}
       

class Model {
  String name;
  Model(this.name);
  bool operator ==(o)=> o is Model && name == o.name;
  int get hashCode => name.hashCode;
  String toString() => this.name;
}

Stream connect() {

  Function onListener = ()=>  print('開始'), 
            onPause   = ()=>  print('暫停'), 
            onResume  = ()=>  print('繼續'), 
            onCancel  = ()=>  print('取消');
   
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
         return false;
       }
        return true;
    });

    return ctrl.stream;
}































Stream<T> streamFromFuture<T>(Iterable<Future<T>> futures) async * {
  for(var f in futures)
   yield await f ;
}
