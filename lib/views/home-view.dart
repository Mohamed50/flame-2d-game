import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:flutter_game/component/start-button.dart';
import 'package:flutter_game/game-controller.dart';

class HomeView {

  final GameController controller;
  Rect titleRect;
  Sprite titleSprite;
  StartButton startButton;

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
    startButton = StartButton(controller);
  }

  void render(Canvas canvas){
    titleSprite.renderRect(canvas, titleRect);
    startButton.render(canvas);
  }

  void onTapDown(TapDownDetails details) {
    startButton.onTapDown(details);
  }

}