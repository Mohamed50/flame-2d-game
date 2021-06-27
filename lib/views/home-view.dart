import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_game/component/credit-button.dart';
import 'package:flutter_game/component/help-button.dart';
import 'package:flutter_game/component/start-button.dart';
import 'package:flutter_game/game-controller.dart';

class HomeView {

  final GameController controller;
  Rect titleRect;
  Sprite titleSprite;
  StartButton startButton;
  HelpButton helpButton;
  CreditsButton creditsButton;

  HomeView(this.controller){
    initializeTitle();
    initializeButtons();
  }

  initializeTitle(){
    double width = controller.tileSize * 7;
    double height = controller.tileSize * 4;
    titleRect = Rect.fromLTWH(controller.screenSize.width / 2 - width / 2, controller.screenSize.height * 0.1, width, height);
    titleSprite = Sprite('branding/title.png');
  }

  initializeButtons(){
    startButton = StartButton(controller);
    helpButton = HelpButton(controller);
    creditsButton = CreditsButton(controller);
  }

  void render(Canvas canvas){
    titleSprite.renderRect(canvas, titleRect);
    startButton.render(canvas);
    helpButton.render(canvas);
    creditsButton.render(canvas);
  }

  void onTapDown(TapDownDetails details) {
    startButton.onTapDown(details);
    helpButton.onTapDown(details);
    creditsButton.onTapDown(details);
  }

}