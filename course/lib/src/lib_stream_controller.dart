
import 'dart:async';
import 'dart:io';
import 'dart:convert';
/*
 建立 single-subscription stream 使用以下建構子
  factory streamController( {coid onListen() , void onPause(),  void onRequme() , onCancel(),  bool sync: false})

 建立 broadcast-subscription stream 使用以下建構子
  factory streamController( { void onListen() , void onCancel() , bool sync: calse })
 */

/* Single-subscription stream 生命週期
 
  Initial:  Stream上 沒有任何subscripton,此時 controller data buffer是滿載狀態
  Subscribed: Stream上 有一個 subscription,此時面對Stream可以執行 subscription 上的方法( onListen , onCancel , onPause, onResume)
  Canceled: Stream上 沒有任何subscripton
  Closed: 此時 Stream上 無法再添加任何事件 (event)

  Broadcast Stream

    Initial: Stream上 沒有任何subscripton, losses all the fired data and error events in the state
    Subscribed: 
    Canceled: no subscription on controller
    Closed: adding more event is not allowed

 */

class LibStreamController {
   static void entry1() {
      print('[Single subscription] Create a stream by stream controller , and then subscribe it');
      Stream<num> stream = _createStreamByController();
      StreamSubscription<num> subscriber = _createSubscription(stream);
    }

    static StreamSubscription<num> _createSubscription(Stream<num> stream) {
      StreamSubscription subscriber ;
          subscriber = stream.listen(
          (num data){
              print(' 收到: $data');
              if(3 == data) subscriber.pause(Future.delayed(const Duration(seconds: 3), ()=> 'ok'));
          },
          onError: (error)=> print(' 收到Ｅrror: $error'),
          onDone: ()=> print);
      return subscriber;
    }

    static Stream<num> _createStreamByController(){
      //建立 single-subscription stream
      StreamController<num> controller = StreamController(
        onListen: ()=>print('onData'),
        onPause: ()=>print('onPause'),
        onResume: ()=>print('onResume'),
        onCancel: ()=>print('onCancel'),
        sync: false
      );

     num i = 0;
     Future.doWhile((){
       controller.add(i++);

       //throws exception
       if(5 == i) controller.addError('on ${i}-th element');
       if( 7 == i) controller.close();
       return 7 == i ? false: true;
     });
     return controller.stream;
    }


 static void entry2() {
      print('[Broadcast subscription] Create a stream by stream controller , and then subscribe by 2 guy');
      Stream<num> stream = _createBroadcasStreamByController();
      StreamSubscription<num> subscriber1 = _createBroadcaseSubscription(stream, 1);
      StreamSubscription<num> subscriber2 = _createBroadcaseSubscription(stream, 2);
     
}

  static StreamSubscription<num> _createBroadcaseSubscription(Stream<num> stream, num subscriberCounter) {
      // Start listening
     StreamSubscription subscriber;

     print('Stream is broadcast stream : ${stream.isBroadcast}');
   
     subscriber = stream.listen((num data){
       print(' subscriber ${subscriberCounter} receive $data');
       if(data == 3) subscriber.pause(Future.delayed(const Duration(seconds: 3), ()=>'ok'));
     }, onError: (err)=>print(' 收到Ｅrror: $err'), onDone:()=>print('done'));   

     return subscriber;
  }

  static Stream<num> _createBroadcasStreamByController(){
    
    StreamController<num> controller = StreamController.broadcast(
       onListen: ()=>print('Listening'),
       onCancel: ()=>print('Canceled'),
       sync: false
    );

    num i = 0;
    Future.doWhile((){      
      controller.add(i++);
      if( 5 == i) controller.addError('on ${i}-th element');
      if( i == 10 ) controller.close();
      return i == 10 ? false:true;
    });

    return controller.stream;
  }

 static void streamView(){
     var stream = Stream.fromIterable([1,2,3,4,5]);
     //create a view 
     var view = StreamView(stream);

     //listen stream view like stream 
     view.listen((data)=>print(data), onError:print, onDone:()=>print('done'));

  }
}