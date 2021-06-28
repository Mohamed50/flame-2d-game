import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_game/game-controller.dart';
import 'package:flutter_game/state/game-state.dart';

class CreditsButton {

  final GameController controller;
  Rect creditRect;
  Sprite creditSprite;

  CreditsButton(this.controller){
    double width = controller.tileSize;
    double height = controller.tileSize;
    creditRect = Rect.fromLTWH(controller.screenSize.width - (controller.tileSize * 1.5), controller.screenSize.height - (controller.tileSize * 1.25), width, height);
    creditSprite = Sprite('ui/icon-credits.png');
  }


  void render(Canvas canvas){
    creditSprite.renderRect(canvas, creditRect);
  }

  void onTapDown(TapDownDetails details){
    if(creditRect.contains(details.globalPosition))
      controller.gameState = GameState.Credit;
  }

}