import 'dart:async';
import 'dart:io';

class UserOfStream {
  UserOfStream(StreamApplication app) {
    app.onExit.listen((msg) => print(msg));
  }
}
//https://stackoverflow.com/questions/14536437/how-do-you-create-a-stream-in-dart
class StreamApplication {
  Stream onExit;

  StreamApplication() {
    print('StreamApplication created');

    /*
    This controller allows sending data, error and done events on its stream. 
    This class can be used to create a simple stream that others can listen on, 
    and to push events to that stream.

    It's possible to check whether the stream is paused or not, 
    and whether it has subscribers or not, as well as getting a 
    callback when either of these change.
     */
    var controller = StreamController();

    //onListen, onPause, onResume, onCancel

    onExit = controller.stream;

    UserOfStream(this);

    controller.add('正在關機中...');

   // exit(0);
  }
}
