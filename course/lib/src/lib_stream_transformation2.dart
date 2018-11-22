import 'dart:async';


// Sink 類別代表泛指所有的資料接收器(者),
//EventSink 透過 add 將trunk加入Stream,透過 close關閉Stream,透過 addError 加入非同步錯誤事件
//客製EventSink 物件, by 實作 EventSink
//The [EventSink] has been designed to handle asynchronous events from
 // [Stream]s. See, for example, [Stream.eventTransformed] which uses
 // `EventSink`s to transform events.
class IntegerToString implements EventSink<int>{

  final EventSink _out;
  IntegerToString(this._out);

  _doTrans(int event) => String.fromCharCode(event);

  @override
  void add(int event) {
    _out.add(_doTrans(event));
  }

  @override
  void addError(Object error, [StackTrace stackTrace]) {
    _out.addError(error, stackTrace);
  }

  @override
  void close() {
    _out.close();
  }
}


/*
 */
class AscIiTransformation implements StreamTransformer {

  Function transferMethod = (EventSink sink) => IntegerToString(sink);

  @override
  Stream bind(Stream stream) {
    return Stream.eventTransformed(stream, transferMethod);
  }

  @override
  StreamTransformer<RS, RT> cast<RS, RT>() {
  }

}

class LibStreamTransform2 {
  static void run() {    
     Stream stream = Stream.fromIterable([65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81]);
     stream
      .transform(AscIiTransformation())
      .listen(print);
      print('將數值Stream轉成字元串');
  }
}