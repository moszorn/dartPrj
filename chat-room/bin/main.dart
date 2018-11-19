import 'package:chat_room/expose.dart';

main(List<String> arguments) {
   final server = new Server();
  ResourceServer().start(
    (webSocket)=> server.addConnection(new HttpServerConnection(webSocket))
    );
}
