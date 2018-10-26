import 'package:stagexl/stagexl.dart';
import 'dart:html' as dom;
import 'dart:math' as math;
import 'dart:async';

const CANVAS_WIDTH = 100;
const CANVAS_HEIGHT = 100;

//http://www.stagexl.org/docs/wiki-articles.html?article=stagescale
Future<Null> exec() async {
official();
   //var canvas = dom.querySelector('#stage');

    
     //BitmapData png = await BitmapData.load('images/avatar-100x100.png');
     //Bitmap avatar = Bitmap(png);

   //var stage = Stage(canvas,width:CANVAS_WIDTH,height:CANVAS_HEIGHT);
   //stage.align = StageAlign.TOP_LEFT;
   
   
   //stage.scaleMode = StageScaleMode.SHOW_ALL;

   
   //tage.scaleMode = StageScaleMode.NO_SCALE;

   
   //stage.scaleMode = StageScaleMode.NO_BORDER;


   //stage.scaleMode = StageScaleMode.EXACT_FIT;
    //stage.addChild(avatar);


//To get the current size of the Stage, you can query the contentRectangle property.
//var rectangle = stage.contentRectangle;


  // var loop = RenderLoop();
   //loop.addStage(stage);
}

official() async{

   const width = 800;
   const height = 600;

   var canvas = dom.querySelector('#stage');
   var stage = Stage(canvas, width: width,height:height);
   stage.scaleMode =StageScaleMode.NO_SCALE;
   //stage.align = StageAlign.NONE;

   BitmapData data = BitmapData(width, height, Color.BlueViolet);
   Bitmap bitmap = Bitmap(data);

   stage.addChild(bitmap);

   stage.addChild(
     Shape()
      ..graphics = ellipse());

  stage.onResize.listen((onData)=>print(stage.contentRectangle));

   var loop = RenderLoop();
   loop.addStage(stage);
}

Graphics ellipse() {
 
  var x = 400;
  var y = 300;
  var width = 150;
  var height = 150;
  int color = Color.Red;

  return  Graphics()
     ..ellipse(x, y, width, height)
     ..fillColor(color);

}