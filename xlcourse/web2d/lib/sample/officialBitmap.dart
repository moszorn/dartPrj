import 'dart:html' as dom;
import 'dart:async';

import 'package:stagexl/stagexl.dart';

const CANVAS_WIDTH = 1903;
const CANVAS_HEIGHT = 889;
const BACKGROUND_WIDTH = 500;
const BACKGROUND_HEIGHT = 500;

Future<Null> exec() async {
  var canvas = dom.querySelector('#stage');
  var stage = new Stage(canvas,
      width: CANVAS_WIDTH,
      height: CANVAS_HEIGHT,
      options: StageOptions()
        ..backgroundColor = Color.White
        ..renderEngine = RenderEngine.WebGL);

  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);

  var painting = new Painting();
  painting.x = 40;
  painting.y = 40;
  stage.addChild(painting);
}

class Painting extends DisplayObjectContainer {
  final List<int> colors = [Color.Red, Color.Green, Color.Blue, Color.Brown];
  Painting() {
    this.addChild(Bitmap(BitmapData(400, 300, Color.BlanchedAlmond)));

    for (var i = 0; i < colors.length; i++) {
      var box = new BitmapData(100, 100, colors[i]);
      var boxBitmap = new Bitmap(box);
      boxBitmap.x = 80 + i * 50;
      boxBitmap.y = 60 + i * 30;
      addChild(boxBitmap);
    }
  }
}
