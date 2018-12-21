import 'package:test/test.dart';
import 'dart:io';
void testURI(){
  
   stdout.writeln('A parsed URI , such as a URL, Uri Class reside in dart:io');
  
    test('create uri',(){
      /*
      Uri({
            String scheme,
            String userInfo,
            String host,
            int port,
            String path,
            Iterable<String> pathSegments,
            String query,
            Map<String, dynamic> queryParameters,
            String fragment
            })
       */
// path , pathSegments 取其一 : path: '/segment1/segment1-sub',
// query , queryParameters 取其一 : name=yama&age=12&isOk=false
//http://zorn@127.0.0.1:8090/segment1/segment1-sub?name=yama&age=12&isOk=false#afterHash.secret
      Uri uri1 = Uri(
        scheme: 'http', 
        host: '127.0.0.1',
        port:8090, 
        pathSegments:<String>['segment1','segment1-sub'],
        queryParameters: {
                          "name": "yama",
                          "age": "12",
                          "isOk": "false"
                        },
        fragment: 'afterHash.secret',
        userInfo: 'zorn');

           print(uri1.toString());

       Uri uri2 = Uri(
        scheme: 'https', 
        host: '127.0.0.1',
        port:8090, 
        path:'/segment1/segment1-sub',
        query: "name=yama&age=12&isOk=false",
        fragment: 'afterHash.secret',
        userInfo: 'zorn');
           print(uri2.toString());

      var uri3 = Uri.parse('https://127.0.0.1:8090/segment1/segment1-sub#afterHash.secret');
      expect(uri3.scheme == 'http', false);
      expect(uri3.origin == 'https://127.0.0.1:8090', true);
      expect(uri3.fragment == 'afterHash.secret',true);
      expect(uri3.path == '/segment1/segment1-sub', true);
    });

    test('en/decodeFull - 編/解碼完整的 URI',(){
        var uri = 'http://example.org/api?foo=some message';
        var encoded = Uri.encodeFull(uri);

        expect(encoded == 'http://example.org/api?foo=some%20message', true);
        expect(uri == Uri.decodeFull(encoded), true);

    });

    test('en/decodeComponent - 解/解碼 URI中的特殊字符（例如 /, &, and :）',(){
       var uri = 'http://example.org/api?foo=some message';
       var encoded = Uri.encodeComponent(uri);
      expect(encoded == 'http%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message',true);
      expect(uri == Uri.decodeComponent('http%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message'),true);
    });

    
}