import "dart:io";
import "dart:convert";
import "dart:async";


class Utils {

  static  String encodeData(Map data){
  return data.keys.map((key)=> '${Uri.encodeComponent(key)}=${Uri.encodeComponent(data[key])}').join('&');
  }
  static toJson(list){
     print( jsonEncode(list) );
  }

  static Stream<int> counter() async* {
    for(int i = 0 ; i< 10 ; i++)
    {
      await Future.delayed(Duration(seconds:1));
      yield i;    
    }     
  }

  static Future<void> doRepeatJobByPeriod(Duration duration, Function fun, [int max_time]) async {
      int time = 1;
      while(true){
         await Future.delayed(duration);
          fun(time);
          if(time++ == max_time) break;
      }
  }
}