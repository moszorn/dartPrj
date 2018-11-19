import "dart:async";

import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelfIo;
import 'package:shelf_proxy/shelf_proxy.dart' as shelfProxy;
import 'package:shelf_web_socket/shelf_web_socket.dart' as shelfSocketer;
import 'package:web_socket_channel/web_socket_channel.dart';

typedef void SocketReceiver(WebSocketChannel webSocket);

//const host = 'http://localhost:8888/libhttp2';
final host = Uri.parse('http://localhost:8080');

class ResourceServer {
  Future start(SocketReceiver sockerReceiver) async {
   /* final cascade = shelf.Cascade()
        .add(shelfSocketer.webSocketHandler(sockerReceiver))
        .add(shelfProxy.proxyHandler(host))
        .add((_) {
      print('Request failed , Check pub serve output for errors.');
      return shelf.Response.notFound('');
    }); */

    final cascade = shelf.Cascade()
        .add(shelfSocketer.webSocketHandler(sockerReceiver))
        .add(shelfProxy.proxyHandler(host));

    await shelfIo.serve(cascade.handler, 'localhost', 26199).then((server) {
      print('Serving at http://${server.address.host}:${server.port}. Please '
          'also run pub serve on port 8080.');
    });
  }
}
