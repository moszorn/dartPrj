  import 'dart:io';
  import 'dart:async';
  import 'dart:convert';
  import 'dart:math' as math;
  
  HttpServer server; 
  const port = 9819;

//程式起始點
void dartEntry() async { 

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



futureClientSend() async {

  var fun1 = () async{
    HttpClient client = await HttpClient();
    HttpClientRequest request = await client.post(InternetAddress.loopbackIPv4.host, port, 'fun1');
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode({"name":"zorn","id":12}));
    
    //HttpClientRequest close後才拿得到 response物件
    HttpClientResponse response = await request.close();
     response.transform(utf8.decoder).forEach(print);          
  },
  fun2 = () async {
    HttpClientRequest request = await HttpClient().get('tw.yahoo.com', 80, '');
    HttpClientResponse response = await request.close();
      response.transform(utf8.decoder).forEach(print);
  },
  fun3 = () async {
      Uri url = Uri.parse('http://yahoo.com');
      HttpClient()
        .getUrl(url)
        .then((httpClientRequest)=>httpClientRequest.close())
        .then((httpClientResponse)=>httpClientResponse.transform(utf8.decoder).forEach(print));
  };


  List<Function> requests = <Function>[fun1,fun2, fun3];
  requests.forEach((f) async{
     await Future.delayed(Duration(seconds: math.Random().nextInt(10)));
     f();
  });

   
}         