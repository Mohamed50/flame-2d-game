import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_game/game-controller.dart';
import 'package:flutter_game/state/game-state.dart';

class HelpView {

  final GameController controller;
  Rect helpDialogRect;
  Sprite helpDialogSprite;

  HelpView(this.controller){
    double width = controller.screenSize.width * 0.70;
    double height = width;
    helpDialogRect = Rect.fromLTWH(controller.screenSize.width / 2 - width / 2, controller.screenSize.height / 2 - height / 2, width, height);
    helpDialogSprite = Sprite('ui/dialog-help.png');
  }



  void render(Canvas canvas){
    helpDialogSprite.renderRect(canvas, helpDialogRect);
  }

  void onTapDown(TapDownDetails details){
    controller.gameState = GameState.Menu;
  }


}