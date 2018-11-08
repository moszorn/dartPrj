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
    ..write('{"name":"yama", "status":1}')
    ..close();
}

void displayListenOnPort(int port) {
  stdout.writeln('Server listen on $port ....');
}

class LibHttp2 {

  static runServer8888() async {
    var port = 8888;
    displayListenOnPort(port);
    print('127.0.0.1:$port/libhttp2');
    HttpServer server = await HttpServer.bind('127.0.0.1',port);
   
    server.listen((request){
        
        print('got request for ${request.uri.path}');
        
        if(request.uri.path == '/libhttp2')
          responseText(request);
        else 
          request.response.write('Not found');

        request.response.close();
      
    },);
  }

  static runServer8889() {
     var port = 8889;
     print('127.0.0.1:$port/libhttp2');
     HttpServer.bind('127.0.0.1', 8889)
      .then((socket){
        displayListenOnPort(port);
         socket.listen((request){
            
            if(request.uri.path == '/libhttp2')
               responseJson(request);
            else
              request.response.write('{"status":0,"msg":"fail"}');
              
              request.response.close();
         });

      });
  }
}