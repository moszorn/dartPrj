import 'package:stagexl/stagexl.dart';
import 'dart:html' as dom;
import 'dart:math' as math;
import 'dart:async';

const CANVAS_WIDTH = 1280;
const CANVAS_HEIGHT = 800;
Future<Null> exec() async {
  /* 準備資源  */
  //Future<BitmapData> future = BitmapData.load('Flower.png');
  BitmapData.load('images/react.png').then((bitmapData) {
    /* 準備 Sprite */
    var bitMap = new Bitmap(bitmapData);
    //設定sprite 中心,與 Sprite位置
    bitMap.scaleX = 2;
    bitMap.scaleY = 2;
    bitMap.pivotX = 225 / 2;
    bitMap.pivotY = 225 / 2;
    bitMap.rotation = math.pi / 8;
    bitMap.x = CANVAS_WIDTH / 2;
    bitMap.y = CANVAS_HEIGHT / 2;

    /* 設定舞台 */
    var stage = new Stage(dom.querySelector("#stage"),
        width: CANVAS_WIDTH,
        height: CANVAS_HEIGHT,
        options: StageOptions()
          ..backgroundColor = Color.White
          ..renderEngine = RenderEngine.WebGL);

    //Sprite 加入舞台
    stage.addChild(bitMap);

    /* 啟動遊戲循環 */
    RenderLoop().addStage(stage);

    /* 制定Sprite特效 */
    var tween = stage.juggler.addTween(bitMap, 1, Transition.easeInOutQuartic);
    tween.animate.rotation.by(4 * math.pi);
  });
}
