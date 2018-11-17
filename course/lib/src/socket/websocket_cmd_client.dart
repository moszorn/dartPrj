import 'dart:io';

const host = '127.0.0.1';
const port = 9080;

main() {
  var wsurl = 'ws://$host:$port/ws';
  WebSocket.connect(wsurl).then((WebSocket socket) {
    socket.add('from client: hello websockets Server!');
    socket.listen(onMessage, onDone: connectionClosed);
  }).catchError(print);
}

void onMessage(msg) {
  print(msg);
}

void connectionClosed() {
  print('Connection to server closed');
}
