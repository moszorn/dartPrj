import 'dart:html';
import 'dart:async';

String encodeData(Map data){
  return data.keys.map((key)=> '${Uri.encodeComponent(key)}=${Uri.encodeComponent(data[key])}').join('&');
}


void main() {
 
  
   Map data = {'data': "some data", 'editor':'yama'};
   String postData = encodeData(data);
   print(postData);
  postTo(postData);

}

void handleEnd(HttpRequest request){
  if(request.status != 200) print('Uh oh, there was an error of ${request.status}');
  else print('Data has been posted');
}

void postTo(postData){
   final String  url = '/register/api';
   var httpRequest = HttpRequest()
          ..open('POST', url)
          ..setRequestHeader('Content-type', 'application/x-www-form-urlencoded')
          ..onLoadEnd.listen((e)=>handleEnd)
          ..send(postData);
}
