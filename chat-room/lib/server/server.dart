import 'dart:convert';
import 'dart:math';

import 'server_connection.dart';

class Server {
  final Random random = new Random();
  final Set<ServerConnection> _connections = Set<ServerConnection>();

  void addConnection(ServerConnection connection) {
    final username = 'anon${random.nextInt(10000)}';
    connection.username = username;
    _connections.add(connection);


    _send(connection, 'hello $username');

    connection.dataFromClient
        .listen((string) => _handleDataFromClient(connection, string));
  }

  void _handleDataFromClient(
      ServerConnection connection, String dataFromClient) {
    final data = json.decode(dataFromClient);
    print('from client: $data');
    // switch case here
  }

  void _sendTo(List<String> usernames, String msg) {
    //for loop usernames to send
  }
  void _sendToAll(String msg) {
    for (final connection in _connections) _send(connection, msg);
  }

  static void _send(ServerConnection connection, String msg) {
    connection.sendToClient(json.encode(msg));
  }
}
