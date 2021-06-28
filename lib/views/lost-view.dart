import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_game/component/text/high-score.dart';
import 'package:flutter_game/component/buttons/start-button.dart';
import 'package:flutter_game/game-controller.dart';

class LostView {

  final GameController controller;
  Rect lostRect;
  Sprite lostSprite;
  StartButton startButton;
  HighScore highScore;

  LostView(this.controller){
    initializeHighScore();
    initializeTitle();
    initializeStart();
  }


  initializeHighScore(){
    highScore = HighScore(controller);
  }

  initializeTitle(){
    double width = controller.tileSize * 7;
    double height = controller.tileSize * 4;
    lostRect = Rect.fromLTWH(controller.screenSize.width / 2 - width / 2, controller.screenSize.height / 2 - height / 2, width, height);
    lostSprite = Sprite('bg/lose-splash.png');
  }

  initializeStart(){
    startButton = StartButton(controller);
  }

  void render(Canvas canvas){
    highScore.render(canvas);
    lostSprite.renderRect(canvas, lostRect);
    startButton.render(canvas);
  }

  void update(double t){
    highScore.update(t);
  }

  void onTapDown(TapDownDetails details) {
    startButton.onTapDown(details);
  }

}