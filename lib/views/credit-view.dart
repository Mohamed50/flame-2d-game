import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_game/game-controller.dart';
import 'package:flutter_game/state/game-state.dart';

class CreditView {

  final GameController controller;
  Rect creditDialogRect;
  Sprite creditDialogSprite;

  CreditView(this.controller){
    double width = controller.screenSize.width * 0.70;
    double height = width;
    creditDialogRect = Rect.fromLTWH(controller.screenSize.width / 2 - width / 2, controller.screenSize.height / 2 - height / 2, width, height);
    creditDialogSprite = Sprite('ui/dialog-credits.png');
  }



  void render(Canvas canvas){
    creditDialogSprite.renderRect(canvas, creditDialogRect);
  }

  void onTapDown(TapDownDetails details){
    controller.gameState = GameState.Menu;
  }


}