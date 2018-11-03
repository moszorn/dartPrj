import "dart:async";
import "dart:io";
import "dart:math" as math;
import "dart:convert";

Stream<int> int1SecDelaedGenerator() async* {
    for(int i = 0 ; i< 10 ; i++)
    {
      await Future.delayed(Duration(seconds:1));
      yield i;    
    }     
  }


//maxCount (Optional Positonal parameter)
Stream<int> timeCounter(Duration interval, [int maxCount]) async* {
  int i = 0;

  //在無窮迴圈中 yield
  while (true) {

    //thread sleep
    await Future.delayed(interval);

    yield i++;

    //沒有傳入 maxCount, 就會無窮的計數
    if (i == maxCount) break;
  }
}
/******************************************************************************************** */
Stream<int> intStreamGenerator(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}
Future<int> intStreamMerge(Stream<int> stream) async {
  var sum = 0;
  //透過 await for 將收到的 stream進行合併
  await for (var value in stream) {
    sum += value;
  }
  return sum;
}
/******************************************************************************************** */
Stream<int> errStreamGenerator(int to) async* {
  for (int i = 1; i <= to; i++) {
    if (i == 4) {
      throw new Exception('err');
    } else {
      yield i;
    }
  }
}
Future<int> sumStreamErr(Stream<int> stream) async {
  var sum = 0;
  try {
    await for (var value in stream) {
      sum += value;
    }
  } catch (e) {
    print('處理Stream時發生錯誤');
    return -1;
  }
  return sum;
}
/******************************************************************************************** */
final String src = """KJIHGFEDCBA 9876543210""";
// 產生新的流（Stream),字串相反的流
Stream<String> source() async* {
  int length = src.length;
  for(;length-1 >= 0 ; --length )
    yield src[length-1];
}
//將Stream chunk合併成一個新字串
Stream<String> lines(Stream<String> source) async* { 
  String str = '';  
  await for (var chunk in source) {  
   str += chunk;
  }
  yield str;
}
/******************************************************************************************** */

class LibStream {
  
   static void streamMerge() async {

     //方法一
     //var stream = intStreamGenerator(10);
     //var sum = await intStreamMerge(stream);

     //方法二
    intStreamMerge(intStreamGenerator(10))
    .then((sum)=> print('sum = $sum'));
     
   }

   static streamCounter() async {
     await for (var i in int1SecDelaedGenerator()){
       print(i);
     }
   }

   static asyncErr() async {
     Stream<int> stream = errStreamGenerator(10);
     int sum = await sumStreamErr(stream);
     print('sum = $sum');
   }

   static line() async{
      //source().forEach((o)=>print(o));
       lines(source()).forEach(stdout.writeln);
      // source().map((d)=> '這是'+d).take(14).forEach(stdout.writeln);
   }

   static periodSimpleJob() async {

      //每隔 Duration period會出發一個 event stream
      // computation method , 會收到從0開始累加的整數
      Stream<int>.periodic(Duration(seconds: 1), (x) => x)
      .take(10)
      .forEach(stdout.writeln);
   }
   static periodPowJob() async {
      //每隔 Duration period會出發一個 event stream
      // computation method , 會收到從0開始累加的整數
      Stream<num> counter = Stream<double>.periodic(Duration(seconds: 1),  (x) => math.pow(x, 2.0)  ).take(10);
      counter.forEach(stdout.writeln); 
   }
  /* 
    To transform the stream events, you can invoke a transforming method 
    such as map() on the stream before listening to it. 
    The method returns a new stream.  
   */
   static map() async {
     Stream<int>.periodic(Duration(seconds: 1), (x) => x)
      .take(10)
      .map((x) => x * 2)
      .forEach(stdout.writeln);
   }


   static expand() async {
      // 0 的 0次方等於 1 print(math.pow(0, 0));
      
      //針對偶數 chunk進行平方,取10次
      Stream<int>.periodic(Duration(seconds: 1), (x) => x)
      .where((x) => x.isEven)
      .expand((x) => [x, math.pow(x, x)])
      .take(10)
      .forEach(stdout.writeln);
   }

   //檔案Stream古典pattern
   static readFile() async {

      Stream<List<int>> content = File('txtfile.txt').openRead();
  
    await content
      .transform(utf8.decoder)
      .transform(LineSplitter())
      .forEach(stdout.writeln);
   }

   static counterBydelayStream() {
    stdout.writeln('程式開始');
    timeCounter(Duration(milliseconds: 500),5).forEach(stdout.write);
    stdout.writeln('程式結束');
   }
}























/*
 == https://www.dartlang.org/tutorials/language/streams ==

Stream 是一序列的事件(asynchronous),或一序列的資料(asynchronous) ,有主動通知/產出的意思
 例如: 
 Data sequences include user-generated events and data read from files.

在Dart中常見處理Stream 可透過 asynchronous 迴圈(await for)或 listen()方法

        //This code simply receives each event of a stream of integer events, 
        //adds them up, and returns (a future of) the sum.
        await for (var value in stream) {
            sum += value;
        }
         return sum;

//using an await for loop, the loops stops when the stream is done.
//When reading a stream using await for, the error is thrown by the loop statement. This ends the loop, as well.
await for 結束迴圈的情況有兩種,一種是Stream 資料或事件已經完畢,另一種是Stream發生錯誤,例如網路延遲等等

//Streams can also deliver error events like it delivers data events.
當Stream發生錯誤時,也是會以事件的方式向外發送
        try {
            await for (var value in streamErr ) {
             sum += value;
            }
        } catch (e) {
            // 當Stream 發生錯誤, -1 會代表錯誤事件的返回
            return -1;
        }


Stream 可以看成是一種非同步的列舉(iterable  Stream<T>),因此它有一系列的 lamda 方法可用,
這些發法都是在 iterable上做動作.

   Future<int> lastPostive(Stream<int> stream) => stream.lastWhere((x) => x >=0 );





Stream 的兩種類型,分別是 Single subscription streams 和 Broadcast streams

Single subscription streams:
 這種Stream 是具有順序性的,資料塊(chunks)的順序只要是不對,這個Stream就不具意義,
 這類的有例如讀取檔案,web request/response , 這類的Stream 用 listen的,並且只需要一次的listen
 當開始listen時,資料流或事件流就會chunk chunk源源不絕自動的來.

Broadcast streams: 
   這類Stream可以個別的處理,可以分別的被處理,例如: 滑鼠點擊事件
   你可以隨時的去注意(listen)這類的Stream, 在事件發生時你會感知的
   並且可以有多個listener可以去注意, listener 也可以取消訂閱, 待有需要時再接續訂閱(listener)


Stream<T> class : A source of asynchronous data events.

A Stream provides a way to receive a sequence of events. 
Each event is either a data event, also called an element of the stream, 
or an error event, which is a notification that something has failed. 
When a stream has emitted all its event, a single "done" event will notify 
the listener that the end has been reached.

Stream  代表你可以接收一序列的事件(a sequence of event),每個事件 (event) 可以看成是 data event , 
或稱Stream中的chunk (element), 當然也包括錯誤發生清況的通知事件, 當Stream中的event都emitted完畢,
最後會emitt一個代表結束的通知事件讓listener知道 .

You listen on a stream to make it start generating events, and to set up listeners that receive the events. 
When you listen, you receive a StreamSubscription object which is the active object providing the events, 
and which can be used to stop listening again, or to temporarily pause events from the subscription.

當開始listen,你啟動了事件(event)源源trunk trunk地而來,但其實你是接收一個稱為 StreamSubscription 物件.

two kinds of streams: "Single-subscription" streams and "broadcast" streams.

Single-subscription:  It doesn't start generating events until it has a listener, 
                      and it stops sending events when the listener is unsubscribed, 
                      even if the source of events could still provide more.
                     Single-subscription streams are generally used for streaming chunks 
                     of larger contiguous data like file I/O.

broadcast stream : broadcast stream allows any number of listeners, and it fires its events 
                   when they are ready, whether there are listeners or not.
                   Broadcast streams are used for independent events/observers.
                   將Single-subscription Stream 用於非 broadcast 場景時,可透過 asBroadcastStream 將 
                   Single-subscription stream 成 broadcast stream 


  stream transformations : Input 是什stream Output就是甚麼Stream 格式 */