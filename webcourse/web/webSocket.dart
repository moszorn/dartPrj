import 'dart:html';
import 'dart:async';


void main() {
 
 
}

final ws = WebSocket('ws://echo.websocket.org');
initWebSocket([int retrySeconds = 2]){
  bool isConnectRetry = false;
  Duration period = Duration(milliseconds: retrySeconds * 1000);
  
  void reconnect(){
    if(!isConnectRetry) 
     {  
       Timer(period, ()=> initWebSocket(retrySeconds*2));
     }
    isConnectRetry = true;      
  }

  ws.onOpen.listen((e){
    print('Connected');
    ws.send('hello');
  });

  ws.onClose.listen((e){
    print('socket closed, retrying in $retrySeconds');
    reconnect();
  });

  ws.onError.listen((e){
    print('Error connectiong to ws');
    reconnect();
  });

  ws.onMessage.listen((MessageEvent e){
    print('Received message ${e.data}');
  });
  
}