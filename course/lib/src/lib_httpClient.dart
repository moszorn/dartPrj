import 'dart:io';
import 'dart:async';
import 'dart:convert';

 
const _jsonMap = {
  'name':'zorn',
  'age': 200,
};
const int _port = 8090;

const _requestPath = '/';
void _sendPost() async{
   
   HttpClientRequest request = await HttpClient()
      .post(InternetAddress.loopbackIPv4.host, _port , _requestPath) 
      ..headers.contentType = ContentType.json
      ..write(jsonEncode(_jsonMap));

    //HttpClientRequest close後才拿得到 response物件
    HttpClientResponse response = await request.close();
    await response.transform((utf8.decoder)).forEach(print);
}

void sendGetToGoogle() async {

  HttpClientRequest request = 
      await HttpClient()
      .getUrl( Uri(host:'www.google.com', scheme: 'https',port: 443, path:'/' ));

    (await request.close())
    .transform(utf8.decoder)
    .forEach(print);
}

void sendGet(){

  print(' 執行前,下要開啟Server, server.dart - 啟動 LibHttp2.runServer8889()');
  var url = Uri.parse('http://127.0.0.1:8889/libhttp2');
  var httpClient = new HttpClient();

  httpClient.getUrl(url)
    .then((HttpClientRequest request) {
      print('發送 httpClient請求到 http://127.0.0.1:8889/libhttp2');
      return request.close();
    })
    .then((HttpClientResponse response) {
      response
        .transform(utf8.decoder)
        .toList()
        .then((data) {
          var body = data.join('');
          print("receive data from remote , respnse : $body");
          httpClient.close();
        });
    });
}


class LibHttpClient {

    static clientGet (){
      sendGet();
    }
}