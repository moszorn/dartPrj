import 'dart:io';
import 'dart:convert';
import 'dart:async';

void responseText(HttpRequest request){
    request.response
    ..headers.contentType = ContentType('text', 'plain')
    ..write('your request been service');
}

void responseJson(HttpRequest request){
  request.response
    ..headers.add(HttpHeaders.contentTypeHeader, 'applicaion/json')
    ..write('{"name":"yama", "status":1}');
}

void displayListenOnPort(int port) {
  stdout.writeln('Server listen on $port ....');
}

void dumpRequestInfo(HttpRequest request) {

  print('got request for ${request.uri.path}'); 
  Map<String,String> queryParameters = request.uri.queryParameters;
  if(queryParameters != null) {
    print('Receive query parameters :');
    queryParameters.forEach((key,val)=>print(" $key = $val"));
  }
        
}

class LibHttp2 {

  static runServer8888() async {
    var port = 8888;
    displayListenOnPort(port);
    print('127.0.0.1:$port/libhttp2');
    HttpServer server = await HttpServer.bind('127.0.0.1',port);
   
    server.listen((HttpRequest request){

        dumpRequestInfo(request);
       
        if(request.uri.path == '/libhttp2')
          responseText(request);
        else 
          request.response.write('Not found');

        request.response.close();
      
    },);
  }


  //底下寫Server的方式比較不建議
  static runServer8889() {
     var port = 8889;
     print('127.0.0.1:$port/libhttp2');
     HttpServer.bind('127.0.0.1', 8889)
      .then((socket){
        displayListenOnPort(port);
         socket.listen((HttpRequest request){
            dumpRequestInfo( request);

            addCROSHeader(request.response.headers);
            if(request.uri.path == '/libhttp2')
               responseJson(request);
            else
              request.response.write('{"status":0,"msg":"fail"}');
              
              request.response.close();
         });

      });
  }
}

void addCROSHeader(HttpHeaders headers){
  headers.add('Access-Control-Allow-Origin', '*');
  headers.add('Access-Control-Allow-Methods', 'POST, OPTIONS');
  headers.add('Access-Control-Allow-Headers',
      'Origin, X-Requested-With, Content-Type, Accept');

}  