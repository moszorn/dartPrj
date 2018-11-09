//有缺陷
import 'dart:async';

// #docregion flawed-stream
// NOTE: This implementation is FLAWED!
// It starts before it has subscribers,
// and it doesn't implement pause.
//必較好的做法是使用 StreamController必須能提供 onListen, onPause 等 callback
// 還有可以透過 subscription機制去停止訂閱
Stream<int> timedCounter(Duration interval, [int maxCount]) {
  var controller = StreamController<int>();
  int counter = 0;

  void tick(Timer timer) {
    counter++;
    controller.add(counter); // Ask stream to send counter values as event.
    if (maxCount != null && counter >= maxCount) {
      /*
      Use timer.cancel() to cancel a repeating timer. This is one reason why timer is passed to the callback run from a repeating timer.
       */
      timer.cancel();
      controller.close(); // Ask stream to shut down and tell listeners.
    }
  }


  /*
  The periodic takes two arguments, a duration and a function to run.
  The duration must be an instance of Duration. 
  The callback must take a single parameter, the timer itself.
   */
  //讓streamsonctoller持續產生chunk
  Timer.periodic(interval, tick); // BAD: Starts before it has subscribers.
  return controller.stream;
}
// #enddocregion flawed-stream

void main() {
//   showBasicUsage();
 //  listenAfterDelay();
  listenWithPause();
}

void showBasicUsage() {
  // #docregion using-stream
  var counterStream = timedCounter(const Duration(seconds: 1), 15);
  counterStream.listen(print); // Print an integer every second, 15 times.
  // #enddocregion using-stream
}

// #docregion pre-subscribe-problem
void listenAfterDelay() async {
  print('延遲五秒後進行訂閱,但是Stream已經開始流了,在五秒後所有存在Stream buffer內的資料一併噴回 ');
  var counterStream = timedCounter(const Duration(seconds: 1), 15);
  
  // 延遲5秒,才進行訂閱,會使得 stream buffer一下噴出keep在 buffer內的資料.
  await Future.delayed(const Duration(seconds: 5));

  // After 5 seconds, add a listener.
  await for (int n in counterStream) {
    print(n); // Print an integer every second, 15 times.
  }
}
// #enddocregion pre-subscribe-problem

// #docregion pause-problem
// 訂閱Stream暫停5秒後會噴出暫停期間的資料
void listenWithPause() {
  var counterStream = timedCounter(const Duration(seconds: 1), 15);
  StreamSubscription<int> subscription;

  subscription = counterStream.listen((int counter) {
    print(counter);
    //在chunk為5時暫停,暫停5秒後,回噴出buffer在 stream的 chunk
    // stream buffers the events, and it then empties its buffer when the stream becomes unpaused.
    if (counter == 5) {
      print('暫停Streaming五秒,但是Stream仍然繼續流著,在五秒後所有存在Stream buffer內的資料一併噴回 ');
  
      // After 5 ticks, pause for five seconds, then resume.
      subscription.pause(Future.delayed(const Duration(seconds: 5)));
    }
  });
}
// #enddocregion pause-problem
