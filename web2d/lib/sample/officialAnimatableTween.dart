import 'package:stagexl/stagexl.dart';
import 'dart:html' as dom;
import 'dart:math' as math;
import 'dart:async';

const CANVAS_WIDTH = 1280;
const CANVAS_HEIGHT = 800;
Future<Null> exec() async {
  const car_width = 128;
  const car_height = 128;


  List<Bitmap> racingCar = [];
  BitmapData data = await BitmapData.load('images/car1.png');
  Bitmap car = Bitmap(data);
  car.scaleX = 0.5;
  car.scaleY = 0.5;

  var stage = Stage(
    dom.querySelector('#stage'), 
    options: StageOptions()
            ..backgroundColor = Color.White 
            ..renderEngine = RenderEngine.WebGL);
  
 var loop = RenderLoop()..addStage(stage);
  for(int i = 0 ; i < 6 ; i++){

     Bitmap car = Bitmap(data);
      car.scaleX = 0.2;
      car.scaleY = 0.2;
      car.y = i * 64;

    stage.addChild(car);

    // Juggler not only takes Tween classes but all classes that implement the Animatable class. 
    loop.juggler.add(moveStraight(car));
  }

   

  



}

int carIdx = 0;
Tween moveStraight(DisplayObject obj) {
    var speeds = [0.5,1,2,3,4,5,6,7];
    var random = math.Random();


   return Tween(obj, speeds[random.nextInt(7)] , Transition.linear)
            .. animate.x.to(850) 
            ..onStart = (){ print('car start');}
            ..onComplete = (){ print('car${++carIdx} complete');};
}



/*
you can create your own classes and add it to the Juggler as long as it implements the Animatable class.
The Animatable class is very simple. It only has one method called 'advanceTime' which takes a time and returns a bool. 
This method is called by the Juggler on every frame for all Animatables added to the Juggler. The time parameter is the time that has passed since the last call.
The boolean return value indicates if the Animatable is still active. If 'false' is returned, the Animatable will be automatically removed from the Juggler 
and therefore it will no longer be called.

    abstract class Animatable {
      bool advanceTime(num time);
    }
 */