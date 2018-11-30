import 'dart:html';
import 'dart:async';

final InputElement email = querySelector('#email');
final DivElement warning = querySelector('#warning');
void main() {
  var mailValidation =
      StreamTransformer.fromHandlers(handleData: emailValidator);

  email.onInput
      .map((dynamic event) => event.target.value as String)
      .transform(mailValidation)
      .listen((o) => warning.innerHtml = '',
          onError: (o) => warning
            ..innerHtml = ''
            ..appendText(o));
}

void emailValidator(String k, EventSink s) {
  if (k.contains('@'))
    s.add(k);
  else
    s.addError('Enter a valid Email');
}
