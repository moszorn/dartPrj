

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

  //5秒後 Server 自動 shutdown
  Timer.periodic(const Duration(seconds: 1), (timer){
      if(timer.tick >= 5){
        server.close();
        timer.cancel();
        print('timer.tick = ${timer.tick} sec server shutdown');
        exit(0);
      } 
  });

    //未來排程設定  
    futureClientSend();

    //啟動Server
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);
    print('Server start at $port');
    server.listen(requestHandler, onDone: ()=>print('server shutdown at $port close'), onError: print);




   
}

futureClientSend() async {

  var fun1 = () async{
    HttpClient client = await HttpClient();
    HttpClientRequest request = await client.post(InternetAddress.loopbackIPv4.host, port, 'fun1');
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode({"name":"zorn","id":12}));
    
    //HttpClientRequest close後才拿得到 response物件
    HttpClientResponse response = await request.close();
    await response.transform(utf8.decoder).forEach(print);          
  },
  fun2 = () async {
    HttpClientRequest request = await HttpClient().get('google.com.tw', 80, '');
    HttpClientResponse response = await request.close();
    response.
  }

   
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
