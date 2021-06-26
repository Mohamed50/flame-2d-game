import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter_game/component/fly.dart';
import 'package:flutter_game/game-controller.dart';

class HungryFly extends Fly{
  HungryFly(GameController controller, double x, double y) : super(controller){
    flyRect = Rect.fromLTWH(x, y, controller.tileSize * 1.5 * 1.1, controller.tileSize * 1.5 * 1.1);
    flyingSprite = <Sprite>[];
    flyingSprite.add(Sprite('flies/hungry-fly-1.png'));
    flyingSprite.add(Sprite('flies/hungry-fly-2.png'));
    deadSprite = Sprite('flies/hungry-fly-dead.png');
  }

}