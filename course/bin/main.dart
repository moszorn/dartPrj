import 'package:course/socket/socket_server.dart' as server;
import 'package:course/socket/socket_client.dart' as client;
import 'package:course/socket/udp.dart' as udp;
/*
 pub.bat run course:main.dart
 */
main(List<String> arguments) {
  //server.start();
  //client.send("hello mssage from socket client");
  udp.start();

  udp.send("message from udp client..");
}
