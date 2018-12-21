import 'package:test/test.dart';
import 'dart:io';
import 'dart:math' as math;

testMath(){

   test("三角函數",(){

     stdout.writeln('Dart 三角函數傳入參數為弧度(radians)不是角度(degree)');
     expect( math.cos(math.pi) == -1.0 , true);

     //測試 sin 30 度為多少徑 
     // 30 度表示為  30 * (math.pi/180) 
     // 45 度表示為 45 * (math.pi/180)
     //所以 sin30 = math.sin( 30 * ( math.pi/ 180 ) )
     num sin30 = 0.5, degrees = 30, radians = degrees * (math.pi/180);//(3.14 * 30/180)

     print(math.sin(radians));//0.49999999999999994

     //toStringAsPresicion 取精確度到小數點第二位
     print(math.sin(radians).toStringAsPrecision(2));//0.50
     print(double.parse(math.sin(radians).toStringAsPrecision(2)));//0.5\

     num sin30Num = math.sin(radians);
     String sin30String = math.sin(radians).toStringAsPrecision(2);
     double sin30Result = double.parse(sin30String);

     expect(sin30Result == sin30, true);
   }); 


   test("比較兩數誰大誰小",(){
      num t = -0.4;
      int u = 3;
      expect(math.max(t, u) == u , true );
      expect(math.min(t, u) == t , true );
   });

   test("Ｍath 中的常數(const)",(){
     stdout.writeln('\t math.e  = ${math.e}');
     stdout.writeln('\t math.pi  = ${math.pi}');
     stdout.writeln('\t math.sqrt2  = ${math.sqrt2}');
   });

   test("隨機",(){     

      //返回值在 0 和 9 之間
      stdout.writeln(math.Random().nextInt(10));

      //Generates a non-negative random floating point value uniformly 
      //distributed in the range from 0.0, inclusive, to 1.0, exclusive.
      stdout.writeln(math.Random().nextDouble());

      stdout.writeln(math.Random().nextBool());
   });




}