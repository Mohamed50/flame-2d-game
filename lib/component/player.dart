import 'dart:ui';

import 'package:flutter/material.dart';
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
    print(currentHealth);
    if(!isDead && currentHealth <= 0){
      isDead = true;
      if(controller.score > (controller.highScoreValue))
        controller.storage.setInt("highScore", controller.score);
      controller.init();
    }
  }

}
