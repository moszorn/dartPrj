  import 'dart:io';
  import 'dart:async';
  import 'dart:convert';
  import 'dart:math' as math;
  
  HttpServer server; 
  const port = 9819;

//程式起始點
void libHttpclient_httpServer() async { 

 //5秒後 Server 自動 shutdown
  Timer.periodic(const Duration(seconds: 1), (timer){
      if(timer.tick >= 11){
        server.close();
        timer.cancel();
        print('timer.tick = ${timer.tick} sec server shutdown');
        exit(0);
      } 
  });

    //未來發送 request 排程設定  
    futureClientSend();

    //啟動Server
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);
    print('Server start at $port');
    server.listen(requestHandler, onDone: ()=>print('server shutdown at $port close'), onError: print);

}

void requestHandler(HttpRequest request) async {

   HttpResponse rp = request.response;
   
      stdout.write('server receive request at path ${request.uri.path} ');

   if(request.uri.path.contains('/fun1')){     

      stdout.writeln(await request.transform(utf8.decoder).join());
      rp ..headers.contentType =ContentType.text
          .. write('fun1 response');

   } else if(request.uri.path.contains('/func2')){

      rp ..headers.contentType = ContentType.json
         ..write('{fun:"fun2", "status":"ok"}');

   } else if(request.uri.path.contains('/quit')){
      rp ..headers.contentType = ContentType.text
         ..write('bye bye');
         server.close();
   } else {
      rp ..headers.contentType = ContentType.text
         ..write('Home page');
   }
}



futureClientSend() async {

  var fun1 = () async{

     try { 

            HttpClient client = await HttpClient();
            HttpClientRequest request = await client.post(InternetAddress.loopbackIPv4.host, port, 'fun1');
              request.headers.contentType = ContentType.json;
              request.write(jsonEncode({"name":"zorn","id":12}));
            
            //HttpClientRequest close後才拿得到 response物件
            HttpClientResponse response = await request.close();
            response.transform(utf8.decoder).forEach(print);          

     } on SocketException catch(e) {
       stderr.write(e.toString());
     }
  },
  fun2 = () async {

    try { 
          HttpClientRequest request = await HttpClient().get('127.0.0.1', port, '/fun2');
          HttpClientResponse response = await request.close();
            response.transform(utf8.decoder).forEach(print);

      } on SocketException catch(e){
        stderr.write('execute httpClientRequest exception ');
        stderr.writeln(e.toString());
      }

  },
  fun3 = () async {
      //直接關閉 Web Server 請求,假如 fun3 排成首先被執行,其後續的 request都會無效,
      //因為 web server已經關閉了. 上面 fun1, fun2 就用了 try catch去補獲 SocketException
      Uri url = Uri.parse('http://localhost:$port/quit');
      HttpClient()
        .getUrl(url)
        .then((httpClientRequest)=>httpClientRequest.close())
        .then((httpClientResponse)=>httpClientResponse.transform(utf8.decoder).forEach(print));
  };


  List<Function> requests = <Function>[fun3 , fun1, fun2 ];
  requests.forEach((f) async{
     await Future.delayed(Duration(seconds: math.Random().nextInt(10))); 
      f();
  });


   
}         