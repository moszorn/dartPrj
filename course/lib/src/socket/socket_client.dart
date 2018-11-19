import "dart:io";

import "dart:async";

Future<Null> tcp_send(String msg) async {
 
  //Socket: This is used by a client to establish a connection to a server
  var socket = await Socket.connect(InternetAddress.loopbackIPv4, 6000);
  socket.write('"$msg"');
  await socket.close();
}

void tcpConnect() {
  var port = 9909;
  Socket.connect("127.0.0.1", port)
    .then((Socket socket){
      print(socket.runtimeType);
      print('Connect to remote ${socket.remoteAddress.address}:${socket.remotePort}');
      // socket.write('Hello, World from a client!');
      // // data from server:
      // socket.listen(onData);
      // socket.destroy();
    });
}

