
//透過 mylib.dart 引入 lib/src 下的東西
import 'package:mylib/mylib.dart';


//直接import lib/src底下的程式, 這是不良習慣
//import 'package:mylib/src/option.dart';



/*
 under example folder
   dart mylib_example.dart
 */
main() {


 
/*   
  const List<int> l = <int>[1,2,3,4,5];
  Error below , const can`t be change
  l[0]=9; 
*/

/* 
    Translator t1 = const Translator(19);

    Translator t2 = const Translator(19);

    print(t1 == t2);// true


    Translator t3 =  Translator(19);

    Translator t4 =  Translator(19);

    print(t3 == t4);// false
*/


/*   
   var map = <String,String>{"a":"aa"};
    map.forEach((k,v){
      print('${k}  ${v}' );
    });
 */

  
/*  var t = Terminal()
   ..clearScreen()
    ..printPrompt('prompt')
    ..callOption('from Terminal');

    print(t.collectInput()); */

    // import 'package:mylib/src/option.dart' as o
    // libOption('main function');


    var options = [
      Option('I want red', '#f00'),
      Option('I want blue','#00f')
    ];

    //terminal.printOptions(options);



}

class Translator {
  final int value;
  const Translator(this.value);
}

/*

class Translator {
  final String redInSpanish;
  const Translator(this.redInSpanish);
}

 */


/*
  
  List<Option> buildFileOptions() {
    return Directory.current
        .listSync()
        .where((entity)=> 
          
            FileSystemEntity.isFileSync(entity.path) && entity.path.containe(new RegExp(r'\.(jpg|png|jpeg'))
          
          )
          .map((entity){
            final filename = entity.path.split(Platform.pathSeparator).last;
            return new Option(filename, entity)
          }).toLost();
  }

  convertImge(FileSystemEntity seelctedFile, String format){
    final raw = (selectedFile as File).readAsBytesSync();
    final img = decodeImage(raw);
  }

  
 */

