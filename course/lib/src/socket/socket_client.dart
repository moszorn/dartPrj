import "dart:io";

import "dart:async";

Future<Null> tcp_send(String msg) async {
  await Future.delayed(Duration(seconds: 2));
  var socket = await Socket.connect(InternetAddress.loopbackIPv4, 6000);
  socket.write('"$msg"');
  await socket.close();
}

