import 'dart:html';
import 'dart:async';
import 'fetchData.dart' as fetchData;

void main() {
 
  fetchData.entry();

  /*
  Buttons have a number of onSomeEvent streams defined, and the onClick stream is defined as Stream<MouseEvent>. This type means that the data that you receive when you listen to the onClick stream is all going to be MouseEvents.
   */
  ButtonElement btn = ButtonElement() ..text='press';
  SpanElement parent = querySelector('#span');
  parent.children.add(btn);

  //mount click
  ElementStream<MouseEvent> clickStream = btn.onClick;
  //clickStream.listen((mouseEvent)=>print('mouse click'));

  int clickCounter = 0;
  StreamSubscription<MouseEvent> subscription = clickStream.listen(null);
  subscription.onData((mouseEvent){
        window.console.info("$clickCounter time");
    clickCounter++;
    if(clickCounter >=2){      
      subscription.cancel();
      window.console.info('btn click unsubscribe');
    } 
  });

}


