import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter_game/game-controller.dart';

class Background {
  final GameController controller;
  Sprite bgSprite;
  Rect bgRect;

  Background(this.controller) {
    bgSprite = Sprite('bg/backyard.png');
    bgRect = Rect.fromLTWH(
      0,
      controller.screenSize.height - (controller.tileSize * 23),
      controller.tileSize * 9,
      controller.tileSize * 23,
    );
  }

  void render(Canvas canvas) {
    bgSprite.renderRect(canvas, bgRect);
  }

  void update(double t) {}
}
