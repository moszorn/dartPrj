import 'dart:io';
import 'dart:async';

/*
WebSocket
connections between a browser and a server are made through a handshake request. 

This is a regular HTTP client request with an upgrade ﬂag in the header, 
also containing a Sec-WebSocket-Key, which is a random value that has been base64 encoded. 
To complete the handshake, the server responds with a Sec-WebSocket-Accept response
 
 
 WebSockets are implemented in all modern browsers (Internet Explorer v10 and above), 
 and can also be used in non-web applications. 

 The communication takes place over TCP port 80, 
 so it can pass unhindered (入無人之境) through frewalls. 因此它可以不受阻礙地通過frewall



 
 */

InternetAddress host = InternetAddress.anyIPv6;
const port = 9080;
main(){

  // Runs [body] in its own zone.
  //runZoned(body)
  runZoned(startWSServer, onError:handleError);
}

handleError(e, stackTrace){
  print('An error occurred: $e $stackTrace');
}

handleRequest(HttpRequest request){
 if( 
   (request.uri.path == '/ws') /* command-line client */ 
   ||
    WebSocketTransformer.isUpgradeRequest(request) /* web-client */
 ) {
     //Upgrade a HttpRequest to a WebSocket connection. 
     WebSocketTransformer.upgrade(request).then(handleWebScoket);
 }
 else {
   print("Regular ${request.method} request for: ${request.uri.path}");
   serverNonWSRequest(request);
 }
}

handleWebScoket(WebSocket socket){
  print('Client connected!');
  socket.listen((msg){
    print(msg);
    socket.add('eecho from server : $msg');
  },
  onDone: ()=>print('client disconnected'),
  onError: (err)=> print('bad websocket request $err'));
}

serverNonWSRequest(HttpRequest req){
    req.response 
    ..statusCode = HttpStatus.forbidden
    ..reasonPhrase = "websocket connections only"
    ..close();
}

startWSServer(){
  // await HttpServer.bind('127.0.0.1',port);
  HttpServer.bind(host,port).then((socket){
    print('Http server start on $host:$port');
    socket.listen(handleRequest);
  });
}

