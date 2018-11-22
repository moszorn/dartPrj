import 'dart:async';
import 'dart:io';
import 'dart:convert';
 
class LibStream2 {

   
     /* Stream factory constructor : fromFuture */
    static future2Stream(){
       Future future = Future.delayed(const Duration(seconds: 1), ()=>3);
       Stream<int> stream = Stream.fromFuture(future);
       StreamSubscription subscription = 
      stream.listen((data){

       },
       onError: print,
       onDone: ()=>print('done'));
    }

    /* Stream factory constructor : fromIterable */
    static iterable2Stream(){
      
      Iterable<int> data = Iterable.generate( 5, (int i)=>  i< 3 ? i : throw new Exception('Wrong data'));

      //Iterable to Stream
      Stream<int> stream = Stream.fromIterable(data);

      StreamSubscription subscription = stream.listen((data){
        print(data);
      },
      onError: print,
      onDone: ()=> print('done'));
    }

  /* Stream factory constructor : fromIterable */
  static void periodStream(){
    Stream<num> stream = Stream.periodic(const Duration(milliseconds: 500), (int count)=> count);
    StreamSubscription subscription ;
    print('count to 8 then cancel by subscription');
    subscription = stream.listen((data){ 
      print(data);
      if(data >= 8) subscription.cancel();
      },onError: print, onDone: ()=>print('done'));
  }

 

}