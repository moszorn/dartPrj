import 'dart:io';
import 'dart:async';

final int _PORT = 8090;

Future httpServer() async {
  stdout.writeln("server start at port ${_PORT}");

  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, _PORT);

// await server.forEach(staticFiles.serveRequest);

  //The server begins listening for HTTP requests using await for. For each request received,
  await for (var req in server) {
    if (req.uri.queryParameters["quit"] != null) {
      req.response
        ..write("bye bye ..")
        ..close();
      await server.close();
      stdout.write("shout down");
    } else {
      req.response.writeln('Hello httpServer method');
      req.response.write(12);
      req.response.close();
    }
  }
}

void handleError(obj) {
  stdout.write("Handle Error");
}

Future stratServer() async {
  HttpServer.bind(InternetAddress.loopbackIPv4, _PORT).then((server) {
    stdout.writeln(" Server start ..");
    server.listen((HttpRequest request) {
      if (null != request.uri.queryParameters['quit']) {
        request.response
          ..write("bye bye")
          ..close();
        server.close();
        stdout.writeln(" Server closed ..");
      } else {
        request.response
          ..write("Hello stratServer method")
          ..close();
      }
    }, onError: handleError);
  });
}

void socketHttp() {
  HttpServer.bind(InternetAddress.loopbackIPv4, _PORT).then((server) {
    stdout.writeln("Server start on port ${_PORT}");
    setSocket(server);
    server.listen((request) {
      request.response.headers.add(HttpHeaders.contentTypeHeader, "text/html");
      request.response
        ..write("""
<!DOCTYPE html>
<html>  
<head>  
  <meta charset="UTF-8">
  <title>socket</title>
</head>  
<body>
 <h3>Welcome socket conn</h3>
 <script>
 var connection = new WebSocket('ws://localhost:${_SOCKET_PORT}');
 connection.onopen = function () {
  connection.send('Ping'); // Send the message 'Ping' to the server
};
connection.onerror = function (error) {
  console.log('WebSocket Error ' , error);
};
connection.onmessage = function (e) {
  console.log('Server: ' + e.data);
};
 </script>
</body>  
</html>           
        """)
        ..close();
    });
  });
}

final int _SOCKET_PORT = 15619;
/* 底下是Server to Server 的Socket寫法 */
Future setSocket(httpServer) async {
  ServerSocket.bind(InternetAddress.loopbackIPv4, _SOCKET_PORT)
      .then((serverSocket) {
    HttpServer.listenOn(serverSocket);
    serverSocket.listen((Socket socket) {
      stdout.writeln("收到訊息");
      socket.write('Hello, client.');
    });
  });
}
