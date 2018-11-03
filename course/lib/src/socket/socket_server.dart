import "dart:io";
import "dart:convert";




void start() async {
  var serverSocket = await ServerSocket.bind('127.0.0.1', 6000);
  print('listening on 6000');
  await for (var socket in serverSocket) {
    socket.listen((List listValue) {
      print(
          '${socket.remoteAddress}:${socket.remotePort} = ${utf8.decode(listValue)}');
    });
  }
}
