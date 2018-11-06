import 'dart:html';
import 'dart:async';


const spanClass = ['win','linux','mac'];
final List<SpanElement> spans = querySelectorAll('.os');
final ButtonElement btn = querySelector('#btn');

final List<SpanElement> lights = querySelectorAll('.light');

var current = 0 , lightLength = 0;

void main() {
    btn.onClick.listen(handler);
    init();
}
void init() {
  lights.forEach((span)=> span.style.visibility = 'visible');
  setBlink(Duration(milliseconds: 10), blink);
}
void handler(MouseEvent e){    
    if(current == 3) current = 0;
    var span = spans[current++];
    var isVisibility = span.style.visibility == 'visible';    
    span.style.visibility = isVisibility ? 'hidden':'visible';
}

void blink(time){

  if(lightLength >= lights.length - 1) lightLength = 0;

    if(lightLength != 0)
       lights[lightLength-1].style.visibility == 'visible'; 
    else lights[lightLength].style.visibility == 'visible'; 

    var span = lights[lightLength++];
    var isVisibility = span.style.visibility == 'visible';    
    span.style.visibility = isVisibility ? 'hidden':'visible';
}



Future<void> setBlink(Duration duration, Function fun, [int max_time]) async {
      int time = 1;
      while(true){
         await Future.delayed(duration);
          fun(time);
          if(time++ == max_time) break;
      }
  }