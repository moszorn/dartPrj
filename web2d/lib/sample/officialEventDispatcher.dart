import 'dart:html' as dom;
import 'dart:math' as math;
import 'dart:async';
import 'package:stagexl/stagexl.dart';

/* const CANVAS_WIDTH = 1903;
const CANVAS_HEIGHT = 889;
const BACKGROUND_WIDTH = 500;
const BACKGROUND_HEIGHT = 500; */

Future<Null> exec() async {
  var canvas = dom.querySelector('#stage');

  var stage = Stage(canvas,
      options: StageOptions()
        ..backgroundColor = Color.White
        ..renderEngine = RenderEngine.WebGL);
  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);

  stage.addChild(Clock());
}

class Clock extends DisplayObjectContainer {
  final List<int> colors = [Color.Black, Color.Blue, Color.Red, Color.Green];
  int _colorIdx = 0;
  TextField _txt;

  Clock() {
    _txt = TextField()
      ..defaultTextFormat = TextFormat("Verdana", 14, Color.Black)
      ..width = 190
      ..height = 16
      ..background = true
      ..backgroundColor = Color.Yellow
      ..text = new DateTime.now().toString();
    this.addChild(_txt);
    this._bind();
  }
  void _onMouseClick(MouseEvent e) {
    this._colorIdx = (1 + this._colorIdx) % this.colors.length;
    this._txt.backgroundColor = this.colors[this._colorIdx];
  }

  void _bind() {
    this._txt.onEnterFrame.listen((EnterFrameEvent e) {
      this._txt.text = new DateTime.now().toString();
    });

    this._txt.onMouseClick.listen(_onMouseClick);
  }
}
