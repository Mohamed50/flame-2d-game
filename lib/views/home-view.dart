import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_game/game-controller.dart';
import 'package:flutter_game/state/game-state.dart';

class HomeView {

  final GameController controller;
  Rect titleRect;
  Sprite titleSprite;
  Rect startRect;
  Sprite startSprite;

  HomeView(this.controller){
    initializeTitle();
    initializeStart();
  }

  initializeTitle(){
    double width = controller.tileSize * 7;
    double height = controller.tileSize * 4;
    titleRect = Rect.fromLTWH(controller.screenSize.width / 2 - width / 2, controller.screenSize.height * 0.1, width, height);
    titleSprite = Sprite('branding/title.png');
  }

  initializeStart(){
    double width = controller.tileSize * 6;
    double height = controller.tileSize * 3;
    startRect = Rect.fromLTWH(controller.screenSize.width / 2 - width / 2, controller.screenSize.height * 0.8, width, height);
    startSprite = Sprite('ui/start-button.png');
  }

  void render(Canvas canvas){
    titleSprite.renderRect(canvas, titleRect);
    startSprite.renderRect(canvas, startRect);
  }

  void update(){}

  void onTapDown(TapDownDetails details){
    if(startRect.contains(details.globalPosition))
      controller.gameState = GameState.Playing;
  }

}