import 'package:tourDart/tourDart.dart' as tourDart;
//root folder:  pub run tourDart:main
//bin folder:  dart main.dart


// A person. The implicit interface contains greet().
class Person {
  // In the interface, but visible only in this library.
  final _name;

  // Not in the interface, since this is a constructor.
  Person(this._name);

  // In the interface.
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Impostor implements Person {
  get _name => '';

  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person person) => person.greet('Bob');

main(List<String> arguments) {
 // string_type();
//map_type();
//positional_positional_parameters();

/*
: --enable-asserts.
~/
%
>>
<<

as
is
is!
??

?.  Conditional member access :  foo?.bar  

 */



//enum_type();

 Line l = Line(Point.center(),Point.angle());
 l?.z = Point(2,3);
 print(l);

}

 enum Color {red,green,blue}
  void enum_type(){

    Color x = Color.red;
    print(x);
    switch(x) {

      case Color.red: 
       print('red enum');
       continue hit;
      break;

      case Color.green:
      print('green green');
       break;

      hit:
      case Color.blue: 
       print('blue enum');
      break;

    }

print('\n');


  print(Color.red.index);
  print(Color.green.index);
  print(Color.blue.index);
  print('\n');

  List<Color> colors = Color.values;
  colors.forEach((c)=>print(c.index));
}

class Point {
  num x,y;
  String color;
  Point(this.x,this.y);
  Point.center():this(0,0);
  Point.angle(){
    x = 0;
    y = 820;
  }
 
  Point.setBy(num t) : x = double.parse(t.toString()) ,y = (t*5.32) ;
}

class Line {
  Point x,y;
  Point z;
  Line(this.x,this.y);
  toString() {
    return 'x=${x.x},${x.y}, y=${y.x} , x=$z';
  }
}

/**
 * In Dart, string is a sequence of UTF-16 code units.
   In Dart,  runes are the UTF-32 code points of a string.

   對於Unicode code point 用 \uXXXX 呈現, XXXX表 4個 16進制數值
   不足4個16進制,用 \u{xxxxx} emoji

   
 */
void about_runes_type(){
  var clapping = '\{1f44f}';
  print(clapping);
  print(clapping.codeUnits);
  print(clapping.runes.toList());

  Runes runes = new Runes(clapping);
  print(new String.fromCharCodes(runes));

  Runes runes2 = new Runes('\u2265 \u{1f605} \u{1f60e} \u{1f596} \u{1f44d} \u{fff}');
  print(new String.fromCharCodes(runes2));

}

/*

 A final variable can be set only once; a const variable is a compile-time constant. (Const variables are implicitly final.) 

  Instance 變數可以是 final, 但不可以是 const , 並且要在物件建構前就被賦值 (assign at initializer list)

  const 變數若在 class 層級宣告必須帶 static ( static const),Top-level 則不需要 , 
  const 除變數宣告修飾外,也可用來宣告值,或建構子 You can also use it to create constant values, as well as to declare constructors that create constant values.
 */
class ConstClass {
  static const name = '';

  //Instance 變數可以是 final, 但不可以是 const
  const age =  3;

  //Instance 變數可以是 final
  final myAge = 100;

  //const 變數若在 class 層級宣告必須帶 static
  static const myWeapon = 3;
}
void final_const_vairable(){

  var foo = const [];
  final bar = const [];
  const baz = [];

} 


//Dart 字串為一個UTF16碼點組成,表示字串可用單引,雙引號, 跳脫字元用 \
//  將運算放到字串用${expression}
// $var 直接於字串中印出 var 變數,Dart會直接呼叫物件的toString()
// 透過 triple quote 表示多行字串
// 顯示 raw data 用 r' '
// 字串取得 Runes資訊可以有 codeUnitAt , codeUnit 屬性回傳 16-bit code unite , 
//     runes屬性取得整個 runes 字串
void string_type(){
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


/*
List is zero based indexing [ 0 ~ litst.length - 1 ]
 */
void list_type(){
   //create a list that`s a compile-time constant
   var constantList = const [1,2,3];

   List<String> strList = <String>["a","b","v"];
}


/*
 Map is an object that associates keys and values. Both keys and values can be any type of object .
 Each key occurs only once .
 */
void map_type(){

  //analyzer infer as Map<String,String>
  var map = {
    'first': 'a',
    'f':'d'
  },
  /**只有在索引2,3,4指定值 */
  map2 = {
    2: 'helium',
    3: 12,
    4: true
  };
  print('map : $map');
  print('map2 = $map2');

 print('-------------------------------------------') ;
  print(map2[0]);
  print(map2[2].runtimeType);
  print(map2[3].runtimeType);
  print(map2[4].runtimeType);
 print('-------------------------------------------') ;


var gifts = Map();
gifts['1']='first';
gifts['2']='second';
gifts['3']='third';
print(gifts['1']);

 print('-------------------------------------------') ;

 var nobleGases = Map();
 nobleGases[2] = '.Net';
 nobleGases[10] = '10 .Net';
 nobleGases[2999] = '2999 .Net';
 print(nobleGases[2]);
 print(nobleGases[2999]);
 print(nobleGases[1]);
 print(nobleGases[3000]);
 print('-------------------------------------------') ;

 var t = {"first": "partridge"};
 print(t["first"]); print(t.length);
 print(t[0]); //null
 print('-------------------------------------------') ;

 final constMyMap = const {
   'name':'yama'
 };


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
void symbol_type(){

}


/*
必要屬性透過 @required

 Scrollbar({Key key, @required Widget child})
   Required is defined in the meta package. Either import package:meta/meta.dart directly, or 
   import another package that exports meta, such as Flutter’s package:flutter/material.dart.

      enableFlags(bold: true, hidden: false);

      void enableFlags({bool bold, bool hidden}) {...}
 */
void positional_named_parameters(){

}

void positional_positional_parameters(){
  say('Bob', 'Howdy');
  say('Bob', 'Howdy', ' MOBILE');
   say('Bob', 'Howdy', ' MOBILE', 'NO');
}
/* positoinal parameters */
void say(String from, String msg, [String device, String ok]){
  var result = '$from says $msg';
  if(device != null){
    result = '$result with a $device ';
  }
  if(ok != null) {
    result = '$result with a $device  $ok';
  }
  print(result);
}

