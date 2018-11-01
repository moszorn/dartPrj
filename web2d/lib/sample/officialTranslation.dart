import 'package:stagexl/stagexl.dart';
import 'dart:html' as dom;

import 'dart:async';

const CANVAS_WIDTH = 1280;
const CANVAS_HEIGHT = 800;

Future<Null> exec() async {
  var canvas = dom.querySelector('#stage');
  var stageOptions = StageOptions()
    ..backgroundColor = Color.Turquoise
    ..renderEngine = RenderEngine.WebGL;
  var stage = Stage(canvas,
      width: CANVAS_WIDTH, height: CANVAS_HEIGHT, options: stageOptions);

  TextField txt = TextField()
    ..defaultTextFormat = TextFormat("Verdana", 50, Color.DarkOrchid)
    ..x = CANVAS_WIDTH / 2
    ..y = CANVAS_HEIGHT / 2
    ..pivotX = 280 / 2
    ..pivotY = 50 / 2
    ..width = 0
    ..height = 0
    ..text = 'hello world';

  dom.querySelector('#btn')
    ..onClick.listen((onData) {
      var translation = new Translation(0, 280, 3, Transition.linear);
      translation.roundToInt = true;
      translation.onUpdate = (num value) {
        txt.width = value;
        txt.height = value;
        print(value);
      };
      stage.juggler.add(translation);
    });

  stage.addChild(txt);
  RenderLoop().addStage(stage);
}
