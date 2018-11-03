import 'dart:io';
import 'dart:convert';
import 'dart:async';

const int PORT = 3000;
void udp_start() {
  print('UDP Server listen on port $PORT\n');
  RawDatagramSocket.bind(InternetAddress.loopbackIPv4, PORT)
      .then((RawDatagramSocket udpSocket) {
    udpSocket.listen((RawSocketEvent event) {
      if (event == RawSocketEvent.READ) {
        Datagram dg = udpSocket.receive();
        print(utf8.decode(dg.data));
      }
    });
  });
}

udp_send(String msg) {
  List<int> payload = utf8.encode(msg);

  RawDatagramSocket.bind(InternetAddress.LOOPBACK_IP_V4, PORT)
      .then((RawDatagramSocket udpSocket) async {
    for (int i = 0; i < 3; i++) {
      await Future.delayed(Duration(seconds: 1));
      udpSocket.send(payload, InternetAddress.LOOPBACK_IP_V4, PORT);
    }
  });
}
