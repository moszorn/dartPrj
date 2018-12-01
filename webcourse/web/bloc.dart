     import 'dart:html';
     import 'dart:async';

    class Bloc {
        StreamController _email = StreamController();
        get email => _email.sink.add;
        get subscribe => _email.stream.listen;
    }

      main() async{

         var emailRedux = Bloc();

         emailRedux.subscribe(print);

        int counter = 0;
        await Future.delayed(const Duration(seconds:3));
        emailRedux.email(counter++);

        await Future.delayed(const Duration(seconds:3));
        emailRedux.email(counter++);

        await Future.delayed(const Duration(seconds:3));
        emailRedux.email(counter++);

     }