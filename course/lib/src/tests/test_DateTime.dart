import 'package:test/test.dart';
import 'dart:io';

testDateTime(){
   test('create date',(){
     int year = 2018, 
        month= 11, 
        day= 6, 
        hour= 11, 
        minute= 59,
        sec= 31,
        millisecond = 789,
        microsecond = 123;
     var d = DateTime(year,month,day,hour,minute,sec,millisecond,microsecond);
     stdout.writeln(d);//2018-11-06 11:59:31.789

      //millisecondsSinceEpoch 的值為 從 “Unix epoch”—1970年1月1號 UTC 時區 開始的毫秒數值
      // 用 Unix epoch 開始的毫秒數來設置時間

      var y2k = new DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);

      // 解析 ISO 8601 格式日期
      //2000-01-01 00:00:00.000Z
      y2k = DateTime.parse('2000-01-01T00:00:00Z');
       stdout.writeln((y2k is DateTime));// true

      stdout.writeln(y2k);//2000-01-01 00:00:00.000Z

      y2k = DateTime.parse('2000-01-01T00:00:00');
      stdout.writeln(y2k);//2000-01-01 00:00:00.000
   });

   test('since 1970-1-1 millisecondsSinceEpoch (從 “Unix epoch”—1970年1月1號 UTC 時區 開始的毫秒數值)', (){
     var y2k = DateTime.utc(2000), 
     nineteen_seventy = DateTime(1970), 
     utc_date =  DateTime.utc(1970);

    expect(nineteen_seventy == utc_date , false);
      stdout.writeln('DateTime(1970) 與 DateTime.utc(1970) 是不一樣的');
      stdout.writeln(nineteen_seventy.millisecondsSinceEpoch); //-28800000
      stdout.writeln(utc_date.millisecondsSinceEpoch);//0

     stdout.writeln('\ty2k=${y2k}\n\t1970=${nineteen_seventy}\n\t1970UTC=${utc_date}');
     expect(utc_date.millisecondsSinceEpoch == 0 , true);
     
     stdout.writeln('從1970-1-1 UTC到 2000-1-1過了 ${y2k.millisecondsSinceEpoch}');
     
   });

   test('Duration operation',(){
      var y2k = DateTime.utc(2000),
          y2000 = y2k.add(const Duration(days:365)) /* 2000-12-31 */,
          y2001 = y2000.add(const Duration( hours: 24,  seconds: 1)); /* 2001-01-01 00:00:01 */

          //2000
          stdout.writeln('y2k=${y2k.year}');

          //2000-12-31
          stdout.writeln('y2000=${y2000.year}-${y2000.month}-${y2000.day} ${y2000.hour}:${y2000.minute}:${y2000.second}');
          stdout.writeln('y2001=${y2001.year}-${y2001.month}-${y2001.day} ${y2001.hour}:${y2001.minute}:${y2001.second}');

          expect(y2k.year == 2000 , true);
          expect(y2k.month == 1, true);
          expect(y2k.day == 1 , true);
          expect(y2001.year == 2001, true);
          expect(( y2001.subtract(const Duration(days: 31)) ).year == 2000 , true);

   });

   test('兩個日期之間的間隔',(){
     // y2k 是閏年
      var y2k = DateTime(2000),
          y2001 = y2k.add(Duration(days: 366));

      // 計算兩個日期之間的間隔
      // 返回一個 Duration 對象
      var duration = y2001.difference(y2k);
      expect(duration.inDays == 366 , true);
   });

}