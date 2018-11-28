import 'dart:io';
import 'dart:async';

class Order {
  String type;
  Order(this.type);
}
class Cake {
  final String type = 'chocolate cake';
  Cake();
}

class LibStreamController2  {

  static void run1(){

    final controller = StreamController();
    final order = Order('chocolate');


    final baker = StreamTransformer.fromHandlers(
      //cakeType 表示 UpStream而來的 data , 這個Transformer 的Upstream 會是 map ,看底下
      handleData: (cakeType, sink){
        //print(cakeType);
        if(cakeType == 'chocolate')
          sink.add(Cake());
        else
          sink.addError("I can`t back that type");
      },
      handleError: (obj,stackTrace,sink){
        print('handleError: $stackTrace');
      }
    );

    //add a new value to be processed by the stream
    controller.sink.add(order);

    controller.stream
      .map((order)=> order.type)
      .transform(baker)
      .listen(
        (cake) => print('$cake'),
        onError: (e) => print('Error: $e') 
      );


  }


}