import 'dart:html' as dom;
import 'dart:async';
import 'package:stagexl/stagexl.dart';
import 'dart:math' as math;



const CANVAS_WIDTH = 580;
const CANVAS_HEIGHT = 500;
Future<Null> exec() async { 

   BitmapData.load('images/react.png')
    .then((data){

   
      var react =  Bitmap(data);
   
      react.x = CANVAS_WIDTH/2;
      react.y = CANVAS_HEIGHT/2;
      
      var pivot = 225 / 2;
      react.pivotX = pivot;
      react.pivotY = pivot;

      /**prepare stage */
      var stageOptions = StageOptions()
      ..backgroundColor = Color.Gray
      ..renderEngine = RenderEngine.WebGL;
      var stage = new Stage(dom.querySelector('#stage'),width: CANVAS_WIDTH, height:CANVAS_HEIGHT, options:stageOptions);

      stage.addChild((react));


      var gameLoop = new RenderLoop();
      gameLoop.addStage(stage);

     stage.juggler.add(
       Tween(react, 1, Transition.easeInCubic)
              ..delay = 0.5
              ..animate.alpha.to(0.0)
              ..animate.x.by(100.0)
              ..onComplete = ()=> print('completed')
     );









    });
}


