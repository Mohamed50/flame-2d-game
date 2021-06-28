import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_game/game-controller.dart';
import 'package:flutter_game/state/game-state.dart';

class StartButton {

  final GameController controller;
  Rect startRect;
  Sprite startSprite;

  StartButton(this.controller){
    double width = controller.tileSize * 6;
    double height = controller.tileSize * 3;
    startRect = Rect.fromLTWH(controller.screenSize.width / 2 - width / 2, controller.screenSize.height * 0.7, width, height);
    startSprite = Sprite('ui/start-button.png');  }


  void render(Canvas canvas){
    startSprite.renderRect(canvas, startRect);
  }

  void onTapDown(TapDownDetails details){
    if(startRect.contains(details.globalPosition))
      controller.gameState = GameState.Playing;
  }

}