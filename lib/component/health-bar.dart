import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/game-controller.dart';

class HealthBar {
  final GameController controller;
  Rect healthRect;
  Rect reamingHealthRect;

  HealthBar(this.controller){
    double barWidth = controller.screenSize.width * 0.75;
    healthRect = Rect.fromLTWH(controller.screenSize.width / 2 - barWidth / 2, controller.screenSize.height * 0.8, barWidth, controller.tileSize * 0.5);
    reamingHealthRect = Rect.fromLTWH(controller.screenSize.width / 2 - barWidth / 2, controller.screenSize.height * 0.8, barWidth, controller.tileSize * 0.5);
  }

  render(Canvas canvas){
    Paint healthPaint = Paint()..color = Colors.blue;
    Paint reamingHealthPaint = Paint()..color = Colors.red;
    canvas.drawRect(healthRect, healthPaint);
    canvas.drawRect(reamingHealthRect, reamingHealthPaint);
  }

  void update(double t){
    double barWidth = controller.screenSize.width * 0.75;
    double percentHealth = controller.player.currentHealth / controller.player.maxHealth;
    reamingHealthRect = Rect.fromLTWH(controller.screenSize.width / 2 - barWidth / 2, controller.screenSize.height * 0.8, barWidth * percentHealth, controller.tileSize * 0.5);
  }


  
}