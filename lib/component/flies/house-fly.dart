import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter_game/component/flies/fly.dart';
import 'package:flutter_game/game-controller.dart';

class HouseFly extends Fly{
  HouseFly(GameController controller, double x, double y) : super(controller){
    flyRect = Rect.fromLTWH(x, y, controller.tileSize * 1.5, controller.tileSize * 1.5);
    flyingSprite = <Sprite>[];
    flyingSprite.add(Sprite('flies/house-fly-1.png'));
    flyingSprite.add(Sprite('flies/house-fly-2.png'));
    deadSprite = Sprite('flies/house-fly-dead.png');
  }

}