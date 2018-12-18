

import 'dart:io';
import 'dart:async';



//引入同一個 package 的 src目錄,因為 console.dart與 file.dart同一層,所以就直接 import
import "lib_console.dart";


enum Permission {
  deny , update , delete , select
}

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

  static aboutRadix(){
    assert(int.parse('42', radix:16) == 66);
    print(int.parse('42'));

    assert(int.parse('F', radix:16) == 15);
    print(int.parse('F',radix:16));
    print(int.parse('f',radix:16));
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

  static tweakPermission(){

    /*
      enum Permission {
          deny , update , delete , select
      }
     */


    var permission1 = Permission.update;//1
    var permission2 = Permission.delete;//2
    var permission3 = Permission.select;//3
    var permission10 = Permission.deny;//0
  	
    // set permission from 1,2
    print( permission1.index | permission2.index );
    
    // revoke all permission
    print( permission10.index & permission2.index );

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

     colors.forEach((c)=> print(c.index));

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


//電腦系統裡面的ASCII碼就是以1個byte為單位儲存字元
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
   //(坑) 注意 {xxxx}是沒意義的, u{xxxx}才是有意義的
   var clapping = '\u{1f44f}';
    print(clapping); //👏
    print(clapping.codeUnits);//[55357, 56399]
    print(clapping.runes.toList());// [128079]

    Runes runes =  Runes(clapping);// ,Runes(傳入 {xxxx}是沒意義的,必須傳入 \u{xxxx})
    print(new String.fromCharCodes(runes));//👏 

//Because a Dart string is a sequence of UTF-16 code units, expressing 32-bit Unicode values within a string requires special syntax.
//對於Unicode code point 用 \uXXXX 呈現, \u2665 => ♥ 
//要指定多於或少於4個十六進制數字(不足4個16進制)，請將值放在大括號中。,用 \u{xxxxx} emoji

    Runes runes2 = new Runes('\u{1f44f} \u{1f605} \u{1f60e} \u{1f596} \u{1f44d} \u{fff}');
    print(new String.fromCharCodes(runes2));//👏 😅 😎 🖖 👍 ࿿ 
    print(new String.fromCharCodes(runes2,2,3));//😅
    print(new String.fromCharCodes([65,66]));//AB
  }

/*
Dart does not have character types.
To convert a code point to a string, you use the String constructor String.fromCharCode:

 */
  static characterType(){
    /*
    A = 65
    B = 66
    C = 67
    D = 68
    w = 119
    x = 120
    y = 121
    z = 122
     */
    'ABCDwxyz'.split('').forEach((o)=>print('$o = ${o.codeUnitAt(0)}'));


    //取得字元的 AscII 編號(CharCode):  codeUnitAt
    //從AscII 編號(CharCode) 轉成字元 : fromCharCode
    int alpha = "a".codeUnitAt(0),omega = "z".codeUnitAt(0);
    stdout.writeln('character a codeUnit : $alpha');
    stdout.writeln('character z condUnit : $omega');
    while(alpha <= omega)
      stdout.write(String.fromCharCode(alpha++));

      stdout.writeln();

     //從AscII 編號(CharCode) 轉成字元 : fromCharCode
     Iterable<int> alphas = Iterable.generate(26,(i)=>omega-i);
     Iterable.generate(10,(i)=> 'item$i').forEach(print);//item0,...item9
     stdout.writeln(String.fromCharCodes(alphas));
      
     
     final list = <int>[87,88,89,90];
     stdout.write(String.fromCharCodes(list));


      // 獲取一個字符串所有字符的 UTF-16 編碼單元
      // 有些字符可能需要用兩個編碼單元來表達
      var codeUnitList = 'Never odd or even'.codeUnits.toList();
      assert(codeUnitList[0] == 78);
  }



  //文字數值 指定保留几位小数
  static toStringAsFixed(){
      // Specify the number of digits after the decimal四捨五入
        assert(123.456.toStringAsFixed(2) == '123.46');
  }
  //文字數值 指定几位有效数字
  static toStringAsPrecision(){
    // Specify the number of significant figures.
    assert(123.456.toStringAsPrecision(2) == '1.2e+2');  //true
    assert(double.parse('1.2e+2') == 120.0); //true
  }

  static stringOperation() {
    // 檢測一個字符串是否包含另外一個字符串
    assert('Never odd or even'.contains('odd'));

    // 一個字符串是否以另外一個字符串開始？
    assert('Never odd or even'.startsWith('Never'));

    // 一個字符串是否以另外一個字符串結束？
    assert('Never odd or even'.endsWith('even'));

    // 查找一個字符串在另外一個字符串中出現的位置。
    assert('Never odd or even'.indexOf('odd') == 6);

    // 轉換為大小
    assert('structured web apps'.toUpperCase() == 'STRUCTURED WEB APPS');

    // 轉換為小寫
    assert('STRUCTURED WEB APPS'.toLowerCase() == 'structured web apps');

    // 截取一個子字符串
assert('Never odd or even'.substring(6, 9) == 'odd');

// 使用一個模式來分割字符串
var parts = 'structured web apps'.split(' ');
assert(parts.length == 3);
assert(parts[0] == 'structured');

// 通過下標索引獲取一個字符（String 對象）
assert('Never odd or even'[0] == 'N');

// 使用 空字符串作為參數調用 split() 函數可以獲取字符串中的
// 所有單個字符，結果為一個內容為 String 的 list
for (var char in 'hello'.split('')) {
  print(char);
}

    // 獲取一個字符串所有字符的 UTF-16 編碼單元
    // 有些字符可能需要用兩個編碼單元來表達
    var codeUnitList = 'Never odd or even'.codeUnits.toList();
    assert(codeUnitList[0] == 78);


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


        // Convert an int to a string.
        assert(42.toString() == '42');

        // Convert a double to a string.
        assert(123.456.toString() == '123.456');


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

void common_sense(){
    //只有在c 為 null時,才賦值 d
  String c,d='d',e = c??d;
  print(e);

  //只有在 f 為 null時 , 才賦值g
  String f,g = 'f is null';
  f ??= g;
  print(g);

  // 只有j不為 null時 , h才會被賦值 (i.toString()), 否則 h 仍然是 null
  String j ;
  String h = j?.toString();
  print(h);
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


