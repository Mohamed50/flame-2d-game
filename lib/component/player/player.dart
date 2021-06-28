import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_game/data/pref-manager.dart';
import 'package:flutter_game/game-controller.dart';

class Player {
  final GameController controller;
  int maxHealth;
  int currentHealth;
  Rect playerRect;
  bool isDead = false;

  Player(this.controller) {
    maxHealth = currentHealth = 400;
    final size = controller.tileSize * 1.5;
    playerRect = Rect.fromLTWH(
      controller.screenSize.width / 2 - size / 2,
      controller.screenSize.height / 2 - size / 2,
      size,
      size,
    );
  }

  void render(Canvas canvas){
    Paint paint = Paint()..color = Colors.amber;
    canvas.drawRect(playerRect, paint);
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
