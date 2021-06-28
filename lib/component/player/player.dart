import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/data/pref-manager.dart';
import 'package:flutter_game/game-controller.dart';

class Player {
  final GameController controller;
  int maxHealth;
  int currentHealth;
  Rect playerRect;
  Sprite playerSprite;
  bool isDead = false;

  Player(this.controller) {
    maxHealth = currentHealth = 400;
    final size = controller.tileSize * 3;
    playerRect = Rect.fromLTWH(
      controller.screenSize.width / 2 - size / 2,
      controller.screenSize.height / 2 - size / 2,
      size,
      size,
    );
    playerSprite = Sprite('player/steve.png');
  }

  void render(Canvas canvas){
    playerSprite.renderRect(canvas, playerRect);
  }

  Future<void> update(double t) async {
    if(!isDead && currentHealth <= 0){
      isDead = true;
      handleHighScore();
      controller.lost();
    }
  }


  handleHighScore(){
    int highScoreValue = PrefManger.getInstance().getHighScore() ?? 0;
    if(controller.playingView.score > (highScoreValue))
      PrefManger.getInstance().setHighScore(controller.playingView.score);
  }

}
