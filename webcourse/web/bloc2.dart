import 'dart:html';
import 'dart:async';

class Validator {
  final emailTransform = StreamTransformer<String, String>.fromHandlers(
          handleData: (data, EventSink sink) {
    if (data.contains('@'))
      sink.add(data);
    else
      sink.addError('invalid input , "@" needed');
  }),
      passwordTramsform = StreamTransformer<String, String>.fromHandlers(
          handleData: (data, EventSink sink) {
    if (data.length >= 3)
      sink.add('');
    else
      sink.addError('invalid length of password');
  });
}

class Blob extends Object with Validator {
  StreamController _email = StreamController<String>();
  StreamController _password = StreamController<String>();

  Stream<String> get email => _email.stream.transform(emailTransform);
  Stream<String> get password => _password.stream.transform(passwordTramsform);

  Function(String) get changeEmal => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  dispose() {
    _email.close();
    _password.close();
  }
}

final TextInputElement iptEmail = querySelector('#email');
final TextInputElement iptPw = querySelector('#password');
final Element warrningEmail = querySelector('#emailhint');
final SpanElement warrningPw = querySelector('#passwordhint');

void main() async {
  BlocEmail(iptEmail.onInput).subscribe((d) {
    warrningEmail..text = '';
  }, onError: (err) {
    warrningEmail
      ..text = ''
      ..text = err;
  });


  //底下用Blob 要分兩次
  var bloc = Blob();
  iptPw.onInput
      .map((dynamic ev) => ev.target.value)
      .listen(bloc.changePassword);

  bloc.password.listen((o) => warrningPw..text = '', onError: (d) {
    warrningPw
      ..text = ''
      ..text = d;
  });
}

class BlocEmail extends Object with Validator {
  StreamController _email = StreamController<String>();

  ElementStream<Event> _elementStream;
  BlocEmail(ElementStream<Event> elementEvent) {
    _elementStream = elementEvent;

    //'_MapStream<Event$, dynamic>
    _elementStream
        .map((dynamic event) => event.target.value as String)
        .transform(emailTransform)
        .listen((data) {
      _email.sink.add(data);
    }, onError: (err) {
      _email.sink.addError(err);
    });
  }

  Function get subscribe => _email.stream.listen;
}
