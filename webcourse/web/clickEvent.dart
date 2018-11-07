import 'dart:html';
import 'dart:async';
import 'fetchData.dart' as fetchData;

 StreamSubscription<MouseEvent> subscription;

void main() {

  ButtonElement btn = ButtonElement() ..text='press' ..attributes['data-counter']="0";
  SpanElement parent = querySelector('#span');
  parent.children.add(btn);

  //mount click
  ElementStream<MouseEvent> clickStream = btn.onClick;
  //subscription = clickStream.listen((mouseEvent)=>print('mouse click'));


   subscription = clickStream.listen(handClick);


}

void handClick(MouseEvent e) {

    var targetElement = (e.target as Element);
    var counterAttribute = targetElement.attributes['data-counter'];
    int clickCounter = int.parse(counterAttribute);
    
    window.console.info("$clickCounter time");

    if(clickCounter >=2){      
        subscription.cancel();
        window.console.info('btn click unsubscribe');
        window.alert('unmount event handler');
    } 

    print('press $clickCounter time');
    ++clickCounter;
    targetElement.attributes['data-counter'] = clickCounter.toString();

}

