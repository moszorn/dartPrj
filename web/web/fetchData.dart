import 'dart:html';
import 'dart:convert';
import 'dart:async';
/* 
<body>
  <button id='fetchBtn'>Get portmanteaus</button>
  <ul id="outputUL"></ul>
</body> */

const path = 'https://www.dartlang.org/f/portmanteaux.json';
const _btn = '#fetchBtn';
const _ul = '#outputUL';


UListElement ul = querySelector(_ul);

void entry(){
  querySelector(_btn).onClick.listen(makeRequestSync);
}


Future<void> makeRequestAsync(Event _) async{  
  HttpRequest request = HttpRequest();
   request
    ..open('GET', path )
    ..onLoadEnd.listen((req)=> repProcess(request))
    ..send('');
}

Future<void> makeRequestSync(Event _) async {
   try {
        final jsonString = await HttpRequest.getString(path);
        loopLi(jsonString);
   } catch (_){
     print('Couldn`t open $path');
     ul.children.add(LIElement()..text = 'Request failed' );
   }
}

void repProcess(HttpRequest request) {
  switch(request.status){
    case 200:
       loopLi(request.responseText);
       break;
    default:     
     ul.children.add(LIElement()..text = 'Request failes, status=${request.status}');
  }
}

void loopLi(String source) {
  List list = json.decode(source);
  list.forEach((s)=>
       ul.children.add(LIElement()..text = s)
  );     
}