import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter_game/game-controller.dart';

import '../fly.dart';


class AgileFly extends Fly {

  double get speed => controller.tileSize * 5;

  AgileFly(GameController controller, double x, double y) : super(controller) {
    flyRect = Rect.fromLTWH(x, y, controller.tileSize * 1.5, controller.tileSize * 1.5);
    flyingSprite = <Sprite>[];
    flyingSprite.add(Sprite('flies/agile-fly-1.png'));
    flyingSprite.add(Sprite('flies/agile-fly-2.png'));
    deadSprite = Sprite('flies/agile-fly-dead.png');
  }
}