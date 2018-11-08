import 'dart:html';
import 'dart:async';
import 'dart:convert' ;

/*
http://127.0.0.1:8889/httpRequest_onReadyStageChange.html
 */
final Uri apiURL =  Uri(scheme: 'http', 
                     host: '127.0.0.1',
                     port:8889, 
                     pathSegments:<String>['libhttp2']);

final ButtonElement btn =  ButtonElement() 
  ..text ='press' 
  ..id='btn';

final SpanElement result = querySelector('#result');

HttpRequest request;

void main() {

    document.body.append(btn);
    btn.onClick.listen(sendAjax);
}

void sendAjax(Event e){


    Map<String,String> queryParameters = {
      "id": "D0TRK2",
      "name": "TUU",
      "level": "2000"
    };
    String queryString = queryParameters.keys.map((key)=> "$key=${queryParameters[key]}").join('&');

    request = HttpRequest();
    request.onReadyStateChange.listen(onData);

    request.open('GET', apiURL.toString() + '?' + queryString);
    request.send();
}

void onData(Event e){

   int readyState = request.readyState , 
       status = request.status;

   if(readyState == HttpRequest.DONE && status == 200)
       window.console.log("request.response = ${request.responseText}");
    else if(readyState == HttpRequest.DONE && status == 0)
      window.console.warn("No Server");

    result.appendText(json.encode(request.responseText));

}
