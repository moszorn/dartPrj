import 'dart:html';
import 'dart:async';
import 'dart:math' as math;

 var btn1 = querySelector('#btn1'), btn2 = querySelector('#btn2'),btn3 = querySelector('#btn3');
void main() {
  
 addNode();
 bindClick();
}

void addNode(){

  
  var pElement = ParagraphElement() ..text ="This is paragraph ..";
      pElement.style.borderColor = '#efe';
      pElement.style.color = 'red';
  var spanElement = Element.html('<span>this is a span</span>');
      spanElement.style.color = 'blue';

   var div99 = Element.html('<div id="div99"></div>');
   for(int i = 0 ; i < 10 ; i++)
      div99.children.add(Element.html('<div id="div${i}">this is div $i</div>') ..style.color = '#${math.Random().nextInt(999)}');


   document.body.children.add(pElement);
   pElement.children.add(spanElement);
   document.body.children.add(div99);
   querySelector('#div99').nodes.add(Text("I am text"));
}

 btn2Handler(MouseEvent e){
        var newDiv = DivElement() ..text='I am new div' ..style.backgroundColor ='#000' ..style.color = '#fff' ..id='newdiv';
        querySelector('#div3').replaceWith(newDiv);
        btn2_listener.cancel();     
 }
 btn3Handler(MouseEvent e) {
    //使用 Node 的 remove() 函數來刪除節點
    querySelector('#div99').remove();
    btn3_listener.cancel();
 }


StreamSubscription<MouseEvent> btn2_listener ;
StreamSubscription<MouseEvent> btn3_listener ;
void bindClick(){
  

    btn1.onClick.listen((MouseEvent t){
      //使用 List 的 add() 函數把一個節點添加到父節點的所有子節點的最後
      querySelector('#div99').nodes.add(Text("hello world"));
    });

     btn2_listener = btn2.onClick.listen(btn2Handler);     
     btn3_listener = btn3.onClick.listen(btn3Handler);




}