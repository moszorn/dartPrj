import 'dart:async';

//Stream Transformer 類別,功用是從一個現有的Stream 產生另一軛轉換過後的Stream
// （必須）建立一個新的轉換後的 Stream
class DoublingTransformer implements StreamTransformer<num,num> {

      //Stream.eventTransformed factory constructor is quite interesting because it creates a new Stream from 
      //the existing one with the help of a sink transformation

      //bind method 必須建立一個新的轉換後的 Stream, (你可以透過 Stream的 eventTransformed 工廠建構子)
      @override
      Stream<num> bind(Stream<num> source) {

        //實際的轉換透過自行客製的轉換器,所有的轉換都是在 EventSink上動作
        // return EventSink
        var mapSink = (EventSink<num> sink) => DoublingSink(sink);


        //底下的 mapSink , 在收到舊有的Stream發出的 SinkEvent後,才進行動作
        //Stream.eventTransformed 這個建構子主要當作一個從現有(舊)Stream到轉換後(新)Stream的中介而已
        //All the events from the existing stream pass through the sink to reach a new stream. 
        //This constructor is widely used to create stream transformers.
        // source  表示 來源Stream
        // mapSink 表示 新的Stream一收到來源Stream後要進行的動作
        return Stream.eventTransformed(source, mapSink);
      }

      @override
      StreamTransformer<RS, RT> cast<RS, RT>() {
        // TODO: implement cast
      }                     
      
}

//DoublingSink可稱為轉換子
class DoublingSink implements EventSink<num>{
    final EventSink<num> _output;
    DoublingSink(this._output);


    //send data event to stream
    @override
    void add(num event) {
    _output.add(2 * event);
    }

    //send an async error to a stream
    @override
    void addError(Object errorEvent, [StackTrace stackTrace]) => _output.addError(errorEvent, stackTrace);

    //send a done event to stream
    @override
    void close() => _output.close();  
}

class LibStreamTransform1 {
   /* Stream factory constructor : eventTransformed */
  /*
    factory Stream.eventTransformed(Stream source, EventSink mapSink(EventSink<T> sink))

    Stream.eventTransformed factory constructor is quite interesting because 
    it creates a new Stream from the existing one with the help of a sink transformation
   */
  static run() {
    print('\n');
    print('使用到 DoublingTransformer (Transformer class) -> DoublingSink (EventSink class) 兩個客製 class');
    print('將[0,1,2,3,4,5,6,7,8,9] stream 轉換成 [0,2,4,6,8,10,12,14,16,18]的 stream');
    Iterable<num> data = Iterable.generate(10, (i)=>i);
    Stream<num> stream = Stream.fromIterable(data);

    //DoublingTransformer 實做了 StreamTransformer<num,num>
   Stream<num> nums = stream.transform(DoublingTransformer());

   nums.listen(print);
  }
}