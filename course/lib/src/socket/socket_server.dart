import "dart:io";
import "dart:convert";




void start() async {
  //ServerSocket: This is used by a server to accept client connections
  var serverSocket = await ServerSocket.bind('127.0.0.1', 6000);
  print('listening on 6000');
  await for (var socket in serverSocket) {
    socket.listen((List listValue) {
      print('${socket.remoteAddress}:${socket.remotePort} = ${utf8.decode(listValue)}');
    });
  }
}
/*************************************************************************/ 
void start2() {
  var port = 9909;
  ServerSocket.bind('127.0.0.1', port )
    .then((ServerSocket socket){
       print('socket ready');
        socket.listen(handleClient);
    })
    .catchError(print);
}
void handleClient(Socket client){
  print('Connection from: ${client.remoteAddress.address}:${client.remotePort}');
  client.transform(utf8.decoder).listen(print);
  client.write('hello from simple socker server');
  client.close();
}
