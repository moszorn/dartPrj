import "dart:io";
import "dart:async";
import "dart:convert";

// 這支Server 只接受 Post method ,

/* HttpRequest object is a stream of byte lists (Stream<List<int>>). 
   To get the data sent from the client, listen for data on the 
   HttpRequest object.

   If the request from the client contains a large amount of data, 
   the data might arrive in multiple chunks.
   You can use the join() method in Stream to concatenate the string values
   of those chunks.  

*/
Future main() async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8089);
  server.forEach((request) async {
    var response = request.response;
    //only POST method associate with json content allowed
    if (request.method == 'POST' &&
        'application/json' == request.headers.contentType) {
      try {
        var postData = await request.transform(utf8.decoder).join();
        var map = jsonDecode(postData) as Map;
        var file = request.uri.pathSegments.last;

        await File(file).writeAsString(postData, mode: FileMode.write);
        response
          ..statusCode = HttpStatus.ok
          ..writeln("wrote data for ${map['name']}");
      } catch (e) {
        response
          ..statusCode = HttpStatus.internalServerError
          ..write("Exception during file I/O: $e");
      }
    } else {
      request.response
        ..statusCode = HttpStatus.methodNotAllowed
        ..writeln("Unsupported request ${request.method}");
    }
    response.close();
  });
}
