import 'dart:html';
import 'dart:async';

class Validator{

  final emailTransform = StreamTransformer<String,String>.fromHandlers(
    handleData:( data,EventSink sink){
      if(data.contains('@')) sink.add(data);
      else sink.addError('invalid input , "@" needed');
  }),
     passwordTramsform = StreamTransformer<String,String>.fromHandlers(
    handleData:( data, EventSink sink){
      if(data.length >= 3) sink.add('');
      else sink.addError('invalid length of password');
    });
}

class Blob extends Object with Validator{

  StreamController _email = StreamController<String>();
  StreamController _password = StreamController<String>();

  Stream<String> get email => _email.stream.transform(emailTransform);
  Stream<String> get password => _email.stream.transform(passwordTramsform);

  Function(String) get changeEmal => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

 dispose(){
    _email.close();
    _password.close();
  }
}


final TextInputElement iptEmail = querySelector('#email');
final TextInputElement iptPw = querySelector('#password');
final SpanElement warrningEmail = querySelector('#emailhint');
final SpanElement warrningPw = querySelector('#passwordhint');

void main() async{
  var bloc = Blob();

  iptEmail.onInput
    .map((dynamic ev)=>  ev.target.value)
    .transform((o)=> bloc.changeEmal(ev.target.value))
    .listen((value)=> print(value));

   iptPw.onInput
    .map((dynamic ev)=>  bloc.changePassword(ev.target.value))
    .listen((value)=> print(value));

}