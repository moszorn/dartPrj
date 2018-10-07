import "dart:io";
import "dart:async";
import "dart:convert";

final String serverAdress = InternetAddress.loopbackIPv4.host;
final String requestPath = "file.txt";
final Map json = {
  'name': 'hello',
  'job': 'world',
  'BFF': 'Chewbacca',
  'ship': 'Millennuim 589,323'
};
/*
The client creates an HttpClient object and uses the post() method to make the request. Making a request involves two Futures:

The post() method establishes a network connection to the server and completes with the first Future, which returns an HttpClientRequest object.

The client composes the request object and closes it. The close() method sends the request to the server and returns the second Future, which completes with an HttpClientResponse object.
*/
Future main() async {
  //requestPath to the requested resource
  HttpClientRequest request =
      await HttpClient().post(serverAdress, 8089, requestPath)
        ..headers.contentType = ContentType.json
        ..write(jsonEncode(json));

  HttpClientResponse response = await request.close();

  // UTF-8 response from the server is decoded.
  // Use a transformer convert the data into regular Dart string format.
  await response.transform(utf8.decoder).forEach(print);

  //  jsonEncode(json)  ---> transform(utf8.decoder).join()
  //  json字串轉Map ---- jsonDecode(jsonString) as Map
}
