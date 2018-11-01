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

void log(String msg) {
  window.console.log(msg);
}

void entry(){

  querySelector(_btn).onClick.listen(makeRequestSync);
  log('hello world 1');

   //onload 非同步載入 portmanteaux.json
   //onload end 非同步載入 portmanteaux.json
   var ajaxRequest = HttpRequest();
   ajaxRequest
    ..open('GET', 'https://www.dartlang.org/f/portmanteaux.json')
    ..onLoad.listen(processResponse)
    ..onLoadEnd.listen((x)=> requestComplete(ajaxRequest))
    ..send('');
 log('hello world 2');
}

void requestComplete(HttpRequest request) {
   log('hello world 3');
  switch (request.status) {
    case 200:
      repProcess(request);
      return;
    default:
      // The GET request failed. Handle the error.
      // ···
  }
}


void processResponse(progressEvent) {
    for (final portmanteau in json.decode(progressEvent.currentTarget.responseText)) {
    ul.children.add(LIElement()..text = portmanteau);
  }
  ul.children.add(LIElement()..text = '......................................');
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