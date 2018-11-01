import 'dart:html' as dom;
import 'dart:math' as math;
import 'dart:async';
import 'package:stagexl/stagexl.dart';

const CANVAS_WIDTH = 800;
const CANVAS_HEIGHT = 300;
const times = 10;
Future<Null> exec() async {
  TextField txt = TextField()
    ..defaultTextFormat = TextFormat("Verdana", 12, Color.White)
    ..width = 200
    ..text = '0'
    ..onEnterFrame.listen((EnterFrameEvent s) =>
        (s.currentTarget as TextField).text = DateTime.now().toIso8601String());

  var flop = 1;
  var delayAction = DelayedCall(() {
    dom.window.console.info(flop++);
  }, 1)
    ..repeatCount = 5;

  StageOptions options = StageOptions()
    ..backgroundColor = Color.Black
    ..renderEngine = RenderEngine.WebGL;

  var stage = new Stage(dom.querySelector('#stage'), options: options);
  var loop = RenderLoop();
  stage.addChild(txt);
  // stage.juggler.add(delayAction);
  loop.addStage(stage);
  loop.juggler.add(delayAction);
}
