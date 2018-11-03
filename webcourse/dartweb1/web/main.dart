import 'dart:html';
import 'dart:async';
import 'dart:convert';

UListElement ul = querySelector('#wordList');

void main() {
  /* <button id="getWords">Get portmanteaux</button>
  <ul id="wordList"></ul> */
  querySelector('#getWords').onClick.listen(makeRequest);
}

Future<String> makeRequest(Event _) async {
  const path = 'https://www.dartlang.org/f/portmanteaux.json';
  final httpRequest = HttpRequest();
  httpRequest
    ..open('GET', path)
    ..onLoad.listen((e) => requestComplete(httpRequest))
    ..send('');
}

void requestComplete(HttpRequest request) {
  switch (request.status) {
    case 200:
      processResponse(request.responseText);
      return;
    default:
      final li = LIElement()..text = 'Request failed. status=${request.status}';
      ul.children.add(li);
  }
}

void processResponse(String jsonString) {
  List list = json.decode(jsonString);
  list.forEach((str) {
    ul.children.add(LIElement()..text = str);
  });
}
