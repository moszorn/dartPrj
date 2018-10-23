import 'dart:html' as dom;
import 'dart:async';
import 'dart:math' as math;
import 'package:stagexl/stagexl.dart';

Future<Null> exec() async {
  /* 準備資源  */
  var resMgr = new ResourceManager();
  resMgr.addBitmapData('dart', 'images/dart@1x.png');
  await resMgr.load();
  var logoData = resMgr.getBitmapData('dart');

  /* 準備 Sprite */
  var logo = new Sprite();
  logo.addChild(new Bitmap(logoData));
  //設定sprite 中心,與 Sprite位置
  logo.pivotX = logoData.width / 2;
  logo.pivotY = logoData.height / 2;
  logo.x = 1280 / 2;
  logo.y = 0;
  logo.mouseCursor = MouseCursor.POINTER;

  /* 準備 Sprite */
  var diamond_bitmap = new BitmapData(100, 100, Color.Orange);
  var diamond = new Bitmap(diamond_bitmap);

  //設定sprite 中心,與 Sprite位置
  diamond.pivotX = 100 / 2;
  diamond.pivotY = 100 / 2;
  diamond.x = 400;
  diamond.y = 390;
  //diamond.rotation = math.pi / 4;

  /* 準備 Sprite */
  var shape = new Shape();
  shape.graphics.circle(100, 100, 60);
  shape.graphics.fillColor(Color.Red);

  /* 設定舞台 */
  var canvas = dom.querySelector("#stage");
  var stageOptions = new StageOptions()
    ..backgroundColor = Color.White
    ..renderEngine = RenderEngine.WebGL;

  var stage =
      new Stage(canvas, width: 1280, height: 800, options: stageOptions);

  //Sprite 加入舞台
  stage.addChild(logo);
  stage.addChild(diamond);
  stage.addChild(shape);

  /* 啟動遊戲循環 */
  var gameLoop = new RenderLoop();
  gameLoop.addStage(stage);

/* 制定Sprite特效 */
  var tween = stage.juggler.addTween(logo, 3, Transition.easeOutBounce);
  tween.animate.y.to(800 / 2);

  var diamondTween =
      stage.juggler.addTween(diamond, 2, Transition.easeInOutSine);
  diamondTween.animate.rotation.by(2 * math.pi);

/* Sprite事件 */
  Tween rotation = null;
  logo.onMouseClick.listen((onData) {
    print(onData);
    if (rotation != null) return;
    rotation = stage.juggler.addTween(logo, 0.5, Transition.easeInOutQuintic);
    rotation.animate.rotation.by(2 * math.pi);
    rotation.onComplete = () => rotation = null;
  });
}
