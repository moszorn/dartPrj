import 'dart:async';
import 'dart:html';
import 'dart:convert';

void _handleServerData(String data) {
  final response = json.decode(data);

  window.console.log(response);
}

/*
void _send(String command) {
  _connection.sendToServer(json.encode(command));
}
*/
main() {
  HttpClientConnection ws_conn = HttpClientConnection();
  ws_conn.dataFromServer.listen(_handleServerData);

  // ws_conn.sendToServer(json.encode('{"topic":12,"name":"aoen"}'));
  delaySend(ws_conn).then((_) {
    print('資料已送出');
  });
}

Future<void> delaySend(HttpClientConnection ws_conn) async {
  await Future.delayed(Duration(seconds: 5));
  ws_conn.sendToServer(json.encode('{"topic":12,"name":"aoen"}'));
}

abstract class ClientConnection {
  Stream<String> get dataFromServer;
  void sendToServer(String string);
}

/// [ClientConnection] using a web socket.
class HttpClientConnection implements ClientConnection {
  final WebSocket _websocket;
  final StreamController<String> _streamController =
      new StreamController<String>();

  factory HttpClientConnection() {
    return HttpClientConnection._(WebSocket('ws://${window.location.host}/ws'));
  }

  HttpClientConnection._(this._websocket) {
    _websocket.onMessage.listen((message) {
      _streamController.add(message.data as String);
    });
  }

  @override
  Stream<String> get dataFromServer => _streamController.stream;

  @override
  void sendToServer(String data) {
    _websocket.send(data);
  }
}
