import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_game/game-controller.dart';
import 'package:flutter_game/state/game-state.dart';

class HelpButton {

  final GameController controller;
  Rect helpRect;
  Sprite helpSprite;

  HelpButton(this.controller){
    double width = controller.tileSize;
    double height = controller.tileSize;
    helpRect = Rect.fromLTWH(controller.tileSize / 2, controller.screenSize.height - (controller.tileSize * 1.25), width, height);
    helpSprite = Sprite('ui/icon-help.png');
  }


  void render(Canvas canvas){
    helpSprite.renderRect(canvas, helpRect);
  }

  void onTapDown(TapDownDetails details){
    if(helpRect.contains(details.globalPosition))
      controller.gameState = GameState.Playing;
  }

}