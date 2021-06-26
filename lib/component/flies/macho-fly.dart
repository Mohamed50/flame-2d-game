import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter_game/component/fly.dart';
import 'package:flutter_game/game-controller.dart';

class MachoFly extends Fly{
  double get speed => controller.tileSize * 2.5;

  MachoFly(GameController controller, double x, double y) : super(controller){
    flyRect = Rect.fromLTWH(x, y, controller.tileSize * 1.5 * 1.35, controller.tileSize * 1.5 * 1.35);
    flyingSprite = <Sprite>[];
    flyingSprite.add(Sprite('flies/macho-fly-1.png'));
    flyingSprite.add(Sprite('flies/macho-fly-2.png'));
    deadSprite = Sprite('flies/macho-fly-dead.png');
  }

}