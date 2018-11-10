import 'dart:async';



class LibTimer{
  

  static periodJob(){  
      //run a repeating function
      // duration must be an instance of Duration
      // callback must take a single parameter, the timer itself.
    Timer.periodic(Duration(seconds: 1), (Timer timer){
      print(timer.tick);
      //cancel a repeating timer
      // This is one reason why timer is passed to the callback run from a repeating timer.
      if(timer.tick>10)
        timer.cancel();
    });
  }

  static oncTimeJob(){
    
    //Notice the callback for a one-shot timer does not take a parameter.
    Timer(Duration(seconds: 1),()=>print('one time job done'));
  }

  static runASAP(){
    //等效於 Timer(Duration.zero, ()=> print('Timer.run() completed');
    Timer.run(()=> print('Timer.run() completed'));
  }

  static streamTimer(){
   StreamSubscription subscription ;
   int data = 0;
   subscription = 
    Stream.periodic(Duration(seconds: 1),(int sec)=> data = sec)
      .take(60)
      .listen(print);

      //每隔一秒去查看 data這個變數是否已被異動為10
      Timer.periodic(Duration(seconds: 1), (Timer timer){
        print('data = $data');
        if(data == 10){
          print('calcel subscription');
          subscription.cancel();
          timer.cancel();
        }
      });

  }

}