import 'dart:async';

import 'server_connection.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HttpServerConnection implements ServerConnection {
  //StreamChannel exposes a Stream for receiving data and a StreamSink for sending it.
  final WebSocketChannel _webSocketChannel;
  final StreamController<String> _streamController = StreamController<String>();

  HttpServerConnection(this._webSocketChannel) {
    _webSocketChannel.stream.listen((data) {
      _streamController.add(data as String);
    });
  }
  @override
  String username;

  @override
  void close() {
    _webSocketChannel.sink.close();
  }

  @override
  Stream<String> get dataFromClient => _streamController.stream;

  @override
  void sendToClient(String data) {
    _webSocketChannel.sink.add(data);
  }
}
