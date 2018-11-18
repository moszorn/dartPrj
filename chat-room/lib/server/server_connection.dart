import 'dart:async';

abstract class ServerConnection {
  String get username;
  set username(String username);

  Stream<String> get dataFromClient;
  void sendToClient(String data);
  void close();
}
