import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter_game/component/flies/fly.dart';
import 'package:flutter_game/game-controller.dart';

class DroolerFly extends Fly{
  double get speed => controller.tileSize * 1.5;

  DroolerFly(GameController controller, double x, double y) : super(controller){
    flyRect = Rect.fromLTWH(x, y, controller.tileSize * 1.5, controller.tileSize * 1.5);
    flyingSprite = <Sprite>[];
    flyingSprite.add(Sprite('flies/drooler-fly-1.png'));
    flyingSprite.add(Sprite('flies/drooler-fly-2.png'));
    deadSprite = Sprite('flies/drooler-fly-dead.png');
  }

}