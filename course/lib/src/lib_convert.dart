import 'dart:convert' show json,utf8,LineSplitter;
import 'dart:io';
import 'dart:async';


const String jsonString ='''
[
  {"score": 40},
  {"score": 80},
  {"score": 100, "overtime": true, "special_guest": null}
]
''';



class LibConvert{

//The json.encode() method converts a Dart object to a JSON-encoded string, 
//    json.decode() method converts a JSON string back into a Dart object.

    //將json 字串轉成Dart : decode
    static j2(){
       dynamic scores = json.decode(jsonString) ;
       print(scores);
       print(scores is List);// true
       print(scores[0] is Map);// true

       (scores as List).forEach((f)=>print(f['score']));
    }


    //將Dart字串轉成jsonString : encode
    static toJ(){

      var scores = [
        {'score': 40},
        {'score': 80},
        {'score': 100, 'overtime': true, 'special_guest': null}
      ];

        String jsonString = json.encode(scores);
        print(jsonString);
    }

    //使用 UTF8.decode() 來解析UTF-8 編碼格式成為dart字元 
    static u8decode(){
      List<int> codeUnits = [
        0xc3, 0x8e, 0xc3, 0xb1, 0xc5, 0xa3, 0xc3, 0xa9,
        0x72, 0xc3, 0xb1, 0xc3, 0xa5, 0xc5, 0xa3, 0xc3,
        0xae, 0xc3, 0xb6, 0xc3, 0xb1, 0xc3, 0xa5, 0xc4,
        0xbc, 0xc3, 0xae, 0xc5, 0xbe, 0xc3, 0xa5, 0xc5,
        0xa3, 0xc3, 0xae, 0xe1, 0xbb, 0x9d, 0xc3, 0xb1
      ];
      var string = utf8.decode(codeUnits);
      print(string);  // Îñţérñåţîöñåļîžåţîờñ
    }

    static utf2dart(){

      // 用 utf8.decoder 作為 Stream (UTF-8 字符轉)換為 Dart string 的 transform() 函數參數
      File('txtfile.txt')
      .openRead()
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .listen( (String content){ 
          print('Read ${content.length} bytes from stream. $content\n');           
        });       
    }

    //用 UTF8.encode() 把一個 Dart string 編碼為 UTF-8 格式的字節流
    static d2utf(){
      //UTF8
       List<int> expected = [0xc3, 0x8e, 0xc3, 0xb1, 0xc5, 0xa3, 0xc3, 0xa9, 0x72,
                        0xc3, 0xb1, 0xc3, 0xa5, 0xc5, 0xa3, 0xc3, 0xae, 0xc3,
                        0xb6, 0xc3, 0xb1, 0xc3, 0xa5, 0xc4, 0xbc, 0xc3, 0xae,
                        0xc5, 0xbe, 0xc3, 0xa5, 0xc5, 0xa3, 0xc3, 0xae, 0xe1,
                        0xbb, 0x9d, 0xc3, 0xb1];

      List<int> encoded = utf8.encode('Îñţérñåţîöñåļîžåţîờñ');

    if (encoded.length != expected.length) print('not equal');
    else {
      for (int i = 0; i < encoded.length; i++) {
        if (encoded[i] != expected[i]) print('utf8 != string');
      }
      print('done');
    }

    }
}

//12450 12452 12450 12531 12461 12531 12464 12467 12531 12464
//アイアンキングコング