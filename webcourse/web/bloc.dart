     import 'dart:html';
     import 'dart:async';

    class Bloc {
        StreamController _email = StreamController();

        Function(int) get email => _email.sink.add;
        Function get subscribe => _email.stream.listen;


        Stream<String> get emailStream => _email.stream;
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