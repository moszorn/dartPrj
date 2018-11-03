import "dart:io";

import "dart:async";

Future<Null> send(String msg) async {
  await Future.delayed(Duration(seconds: 2));
  var socket = await Socket.connect(InternetAddress.LOOPBACK_IP_V4, 6000);
  socket.write('"$msg"');
  await socket.close();
}

String toString() {
  return "Socket Client";
}
