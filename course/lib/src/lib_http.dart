import 'dart:io';
import 'dart:async';
import 'dart:convert';

const int _port = 8090;

//  jsonEncode(json)  ---> transform(utf8.decoder).join()
  //  json字串轉Map ---- jsonDecode(jsonString) as Map

Future lib_startHttpServer() async {
   stdout.writeln('[lib_startHttpServer]  Server ($_port) 啟動');
   var server = await HttpServer.bind(InternetAddress.loopbackIPv4, _port);
   await for(var req in server){
     if(req.uri.queryParameters['quit'] != null){
        req.response
        ..write('bye bye..')
        ..close();

        await server.close();
        stdout.write('Server關閉');
     } else {
       req.response.writeln('Hello from httpServer response');
       req.response.writeln(12);
       req.response.write('/?quit  離開');
       req.response.write('.....');
       req.response.close();
     }
   }
}
/**************************************************************************************************** */
const jsonMap = {
  'name':'zorn',
  'age': 200,
};
const postUrl = 'http://127.0.0.1:$_port';

const requestPath = '/';
void sendPost() async{
   HttpClientRequest request = await HttpClient()
      .post(InternetAddress.loopbackIPv4.host, _port , requestPath)
      ..headers.contentType = ContentType.json
      ..write(jsonEncode(jsonMap));

    HttpClientResponse response = await request.close();
    await response.transform((utf8.decoder)).forEach(print);
}


const postData = '''
{
  "name":"zorn","age":100
}
''';
const fetch = '''
fetch("$postUrl",{
  body: JSON.stringify($postData),
  cache: 'no-cache',
  credentials: 'same-origin',
  headers: {
    'user-agent': 'chrome','content-type': 'application/json'
  },
  method: 'POST',
  mode: 'cors',
  redirect: 'follow'
}).then((rep)=> rep.json()).then((o)=>console.log(o));
''';
const htmlPage = ''' 

<input id='btn' type='button' value='send'/>

<script>
 var btn = document.querySelector('#btn')
 btn.addEventListener('click',ajaxPost,false);
 function ajaxPost(t) {
   console.log('%o',t);
   $fetch ;
 }
</script>
''';
// 這支Server 只接受 Post method ,

/* HttpRequest object is a stream of byte lists (Stream<List<int>>). 
   To get the data sent from the client, listen for data on the 
   HttpRequest object.

   If the request from the client contains a large amount of data, 
   the data might arrive in multiple chunks.
   You can use the join() method in Stream to concatenate the string values
   of those chunks.  

*/
Future lib_OnlyPostHttpServer() async{
 
  HttpServer server ;
  int port = 8090;
  server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);
   stdout.writeln('[lib_httpServerUp] Server ($port) 啟動');

    //設定五秒後對 post server ping 一下
    new Timer(Duration(seconds:5),sendPost);




  server.forEach((socket) async{

    var response = socket.response;
    stdout.writeln('request method: ${socket.method}  content: ${socket.headers.contentType}');
    if(socket.method ==  'POST' && 'application/json' == socket.headers.contentType.value) {

      try {
        var postData = await socket.transform(utf8.decoder).join();

        stdout.writeln(postData);
        var json = jsonDecode(postData) as Map;

        // 寫入檔案
        //var file = request.uri.pathSegments.last;
        //await File(file).writeAsString(postData, mode: FileMode.write);

        response ..statusCode = HttpStatus.ok
                 ..writeln('{"statue":"success"}');

      } catch (_){
        response ..statusCode = HttpStatus.internalServerError
        ..write("Exception during file I/O $_");
      }
    } else if(socket.method ==  'GET') {
       response.headers.add(HttpHeaders.contentTypeHeader, 'text/html');
       response..write(htmlPage);
    } else {
      response ..statusCode = HttpStatus.methodNotAllowed
      .. write('Unsupported request ${socket.method}');
    }
    response.close();
  });
}
/**************************************************************************************************** */



void handleRequestError(e){

}

Future lib_httpServerUp() async {
   
    HttpServer server;
   
    Function _handleRequest = (HttpRequest request){
        if(request.uri.queryParameters['quit'] != null){
          request.response
            ..write('bye bye..')
            ..close();
            server.close();
        } else {
            request.response.writeln('Hello from httpServer response');
            request.response.writeln(12);
            request.response.write('/?quit  離開');
            request.response.write('.....');
            request.response.close();
        }
    };

    var _handleRequestError = (e) {
      stdout.write(e);
    };
   

     server = await HttpServer.bind(InternetAddress.loopbackIPv4, _port);
     stdout.writeln('[lib_httpServerUp] Server ($_port) 啟動');
     server.listen(_handleRequest, onError: _handleRequestError);
}
/**************************************************************************************************** */
const responseHTML = '''
<!DOCTYPE html>
<html>  
<head>  
  <meta charset="UTF-8">
  <title>socket</title>
</head>  
<body>
 <h3>Welcome socket conn</h3>
 <script>
 var connection = new WebSocket('ws://localhost:10009');
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
''';




/*
 HttpServer 與 Socket 都在同一台
 */
Future lib_httpServerSocket() async{

  HttpServer server;
  var port = 8090;
  var socket_port = 10009;

   server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);
   stdout.writeln('[lib_httpServerSocket] Server ($port) 啟動');
   server.listen((request){
       request.response.headers.add(HttpHeaders.contentTypeHeader, 'text/html');
       request.response..write(responseHTML)..close();
   });

   ServerSocket.bind(InternetAddress.loopbackIPv4, socket_port)
    .then((socket) {
          stdout.writeln('[lib_httpServerSocket] Socket ($socket_port) 啟動');
          HttpServer.listenOn(socket);
          socket.listen((Socket socket) {
            stdout.writeln("收到訊息");
            socket.transform(utf8.decoder).forEach(print);
            socket.write('Hello, client.');
          });
    });

}

