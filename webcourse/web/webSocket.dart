import 'dart:html';
import 'dart:async';

void outputMessage(Element e, String message) {
  print(message);
  e.appendText(message);
  e.appendHtml('<br/>');
  //Make sure we 'autoscroll' the new messages
  e.scrollTop = e.scrollHeight;
}

void main() {
  TextInputElement inp = querySelector('#input');
  DivElement out = querySelector('#output');
  String srvuri = 'ws://localhost:9080/ws';
  WebSocket ws = new WebSocket(srvuri);

  inp.onChange.listen((Event e) {
    ws.send(inp.value.trim());
    inp.value = "";
  });

  ws.onOpen.listen((Event e) {
    outputMessage(out, 'Connected to server');
  });
  ws.onMessage.listen((MessageEvent e) {
    outputMessage(out, e.data);
  });
  ws.onClose.listen((Event e) {
    outputMessage(out, 'Connection to server lost...');
  });

  ws.onError.first.then((_) {
    print("Failed to connect to ${ws.url}. "
        "Please rerun bin/websocket_server.dart and try again.");
  });
}

final ws = WebSocket('ws://echo.websocket.org');

initWebSocket([int retrySeconds = 2]) {
  bool isConnectRetry = false;
  Duration period = Duration(milliseconds: retrySeconds * 1000);

  void reconnect() {
    if (!isConnectRetry) {
      Timer(period, () => initWebSocket(retrySeconds * 2));
    }
    isConnectRetry = true;
  }

  ws.onOpen.listen((e) {
    print('Connected');
    ws.send('hello');
  });

  ws.onClose.listen((e) {
    print('socket closed, retrying in $retrySeconds');
    reconnect();
  });

  ws.onError.listen((e) {
    print('Error connectiong to ws');
    reconnect();
  });

  ws.onMessage.listen((MessageEvent e) {
    print('Received message ${e.data}');
  });
}
