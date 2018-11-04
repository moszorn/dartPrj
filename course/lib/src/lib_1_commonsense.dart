import 'dart:io';
import 'dart:async';



//引入同一個 package 的 src目錄,因為 console.dart與 file.dart同一層,所以就直接 import
import "lib_console.dart";


enum Color {
  red, green, blue, brown, black, white
}

class LibCommonSense{

  static clearScreen(){
    LibConsole.clearScreen();
  }


//Numbers :  Both int and double are subtypes of num (An integer or floating-point number.)
//  int : -2^63  ~  2^63 -1
//  double:  (double-precision) floating-point number

//Integers are numbers without a decimal point. If a number includes a decimal, it is a double.
  static aboutInt(){
      int x = 1;
      int hex = 0xDEADBEEF;
      double y = 1.1;
      double exponents = 1.42e5;

  }

  static aboutCast() {
      int one = int.parse('1'); //String to int
      double d = double.parse('1.1'); //String to double
      String i = 1.toString(); //int to String
      String s = 3.14159.toStringAsFixed(2); //double to String 
  }

  static aboutBitShift(){
    assert((3 | 4) == 7); // 0011 | 0100 == 0111 bitwise shift
  }


  static aboutEnum(){

     print('Color rnum index:');
     print('  ' + Color.red.index.toString());
     print('  ' + Color.green.index.toString());
     print('  ' + Color.blue.index.toString());
     print('  ' + Color.brown.index.toString());
     print('  ' + Color.black.index.toString());

     Color color = Color.red;
     print(color);
     print(' ${color.runtimeType} $color index: ${color.index}');


     List<Color> colors = Color.values;
     colors.forEach(
       (c)=> print(c.index)
       );

     switch(color) {
       case Color.red:
          //do something
          continue everybodydo;
        break;
       case Color.green:
          //do something
       break;
       case Color.brown:
          //do something
       break;
       case Color.white:
          //do something
       break;
       case Color.black:
          //do something
       break;

       everybodydo:
       case Color.blue:
         print('Every body do');
       break;
     }
     stdout.writeln();
  }

//In Dart, string is a sequence of UTF-16 code units.
//In Dart,  runes are the UTF-32 code points of a string.
//Dart 中 runes 是UTF-32字符集的string 對象。codeUnitAt 和 codeUnit 用來獲取UTF-16字符集的字符。使用runes 來獲取UTF-32字符集的字符。
//Dart 字串為一個UTF16碼點組成,要表示字串可用單引,雙引號, 至於跳脫字元用 \
//  將運算放到字串用 ${expression}
// $var 直接於字串中印出 var 變數,Dart會直接呼叫物件的toString()
// 透過 triple quote 表示多行字串
// 顯示 raw data 用 r' '
// 字串取得 Runes資訊可以有 codeUnitAt , codeUnit 屬性回傳 16-bit code unit , 
//     runes屬性取得整個 runes 字串
 static about_runes(){
   var clapping = '\{1f44f}';
    print(clapping);
    print(clapping.codeUnits);
    print(clapping.runes.toList());

    Runes runes = new Runes(clapping);
    print(new String.fromCharCodes(runes));

//Because a Dart string is a sequence of UTF-16 code units, expressing 32-bit Unicode values within a string requires special syntax.
//對於Unicode code point 用 \uXXXX 呈現, \u2665 => ♥ 
//要指定多於或少於4個十六進制數字(不足4個16進制)，請將值放在大括號中。,用 \u{xxxxx} emoji

    Runes runes2 = new Runes('\u2265 \u{1f605} \u{1f60e} \u{1f596} \u{1f44d} \u{fff}');
    print(new String.fromCharCodes(runes2));
  }


//In Dart, string is a sequence of UTF-16 code units.
//In Dart,  runes are the UTF-32 code points of a string.
//Dart 字串為一個UTF16碼點組成,要表示字串可用單引,雙引號, 至於跳脫字元用 \
//  將運算放到字串用 ${expression}
// $var 直接於字串中印出 var 變數,Dart會直接呼叫物件的toString()
// 透過 triple quote 表示多行字串
// 顯示 raw data 用 r' '
// 字串取得 Runes資訊可以有 codeUnitAt , codeUnit 屬性回傳 16-bit code unit , 
//     runes屬性取得整個 runes 字串
  static aboutString(){
      print('Hello\'s World');
      print("Hello's World");


      var str = "Hello\" World";
      print("This is $str");
      print("This is ${str.toUpperCase()}");

      //triple quote 
      var mulStr1 = '''You can create
      multi-line strings like this one.
      ''';

      var mulStr2 = """You can create
      multi-line strings like this one.
      """;

      //顯示raw data
      var rawData = r'\{1f44f} $str';
      print(rawData);
  }

void aboutString2(){
  //v2是編譯時期字串, 因此底下是合法的,
  // const_n , const_b, const_string 都是編譯時就知道的
  const const_n = 0, const_b = true , const_string = 'string';
  const v2 = '$const_n $const_b $const_string';


  var n = 0, b = true, s = 'string';
  //底下不允許,因為 n , b ,s 都是運行時期才知道的,而 v1 是編譯時期就必須決定的
 // const v1 = '$n $b $s';
}



/*
在Dart中表示一 operator , 或 identifier .
Symbol literals are compile-time constants.
minification changes identifier names but not identifier symbols.

透過 前置#於identifer取得 symbol
  例如:
    #radix
    #bar
 */



  /*

 A final variable can be set only once; a const variable is a compile-time constant. (Const variables are implicitly final.) 

  Instance 變數可以是 final, 但不可以是 const , 並且要在物件建構前就被賦值 (assign at initializer list)

  const 變數若在 class 層級宣告必須帶 static ( static const),Top-level 則不需要 , 
  const 除變數宣告修飾外,也可用來宣告值,或建構子 You can also use it to create constant values, as well as to declare constructors that create constant values.
 
 //Instance variable 可以是 final, 但不可以是 const
 //const 變數若在 class 層級宣告必須帶 static

 
 */


}




// Optional positional parameters 宣告
// Wrapping a set of function parameters in [] marks 
// them as optional positional parameters:

/* positoinal parameters */
void say(int from, bool msg, [String device, String ok]){
  var result = '$from says $msg';
  if(device != null){
    result = '$result with a $device ';
  }
  if(ok != null) {
    result = '$result with a $device  $ok';
  }
  print(result);
}

//執行
void positional_parameters(){
  //呼叫執行方法,傳入 Optional positional parameters
  say(1, true);
  say(2, false, ' MOBILE');
  say(4, true, ' MOBILE', 'NO');
}




// @required
// Required is defined in the meta package. 
// Either import package:meta/meta.dart directly, 
// or import another package that exports meta, 
// such as Flutter’s package:flutter/material.dart. 

// Optional named parameters 宣告
/// Sets the [bold] and [hidden] flags ...
bool enableFlags({bool bold, bool hidden}) {
   bold = !hidden;
   return !bold;
}

void calleEnableFlags() {  
  //呼叫執行方法,傳入 Optional named parameter
  enableFlags(hidden: false, bold: true);
}


