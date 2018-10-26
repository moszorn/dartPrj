/* var resourceManager = new ResourceManager()
  ..addBitmapData('dog', 'images/dog.png')
  ..addSound('plop', 'sounds/plop.mp3')
  ..addTextureAtlas('fl', 'images/flowers.json', TextureAtlasFormat.JSONARRAY);

resourceManager.load().then((result) {
  var dog = resourceManager.getBitmapData('dog');
  var plop = resourceManager.getSound('plop');
  var soundTransform = new SoundTransform(0.5);
  var soundChannel = sound.play(false, soundTransform);
  var flowers = resourceManager.getTextureAtlas('fl');
  var daisy = flowers.getBitmapData('daisy');
}); */
import 'dart:html' as dom;
import 'dart:math' as math;
import 'dart:async';
import 'package:stagexl/stagexl.dart';

Future<Null> exec() async {
  byResourceMgr();
}

byResourceMgr() async {
 var resMgr = ResourceManager();
    resMgr
    ..addBitmapData('car1', 'images/car1.png')
    ..addBitmapData('car2', 'images/car2.png')
    ..addBitmapData('car3', 'images/car3.png')
    ..load()
    .then((_){
     RenderLoop()
     ..addStage(
       Stage(dom.querySelector('#stage'),
       width: 512,
       height: 512,
             options:StageOptions()
             ..backgroundColor = Color.White
             ..renderEngine = RenderEngine.WebGL)
             ..addChild(Bitmap(resMgr.getBitmapData('car1')))
             ..addChild(Bitmap(resMgr.getBitmapData('car2')))
             ..addChild(Bitmap(resMgr.getBitmapData('car3')))
     );
    });
}