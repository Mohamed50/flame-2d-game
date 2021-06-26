import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/game-controller.dart';

class Enemy {
  final GameController controller;
  int health;
  int damage;
  double speed;
  Rect enemyRect;
  bool isDead = false;

  Enemy(this.controller, double x, double y) {
    health = 3;
    damage = 1;
    speed = controller.tileSize * 2;
    final size = controller.tileSize * 1.2;
    enemyRect = Rect.fromLTWH(
      x,
      y,
      size,
      size,
    );
  }

  void render(Canvas canvas) {
    Color color;
    switch (health) {
      case 1:
        color = Colors.green[200];
        break;
      case 2:
        color = Colors.green[300];
        break;
      case 3:
        color = Colors.green[500];
        break;
      default:
        color = Colors.red;
    }
    Paint paint = Paint()..color = color;
    canvas.drawRect(enemyRect, paint);
  }

  void update(double t) {
    if (!isDead) {
      double stepDistance = speed * t;
      Offset toPlayer = controller.player.playerRect.center - enemyRect.center;
      if (stepDistance <= toPlayer.distance - controller.tileSize * 1.25) {
        Offset stepToPlayer = Offset.fromDirection(
          toPlayer.direction,
          stepDistance,
        );
        enemyRect = enemyRect.shift(stepToPlayer);
      }
      else{
        attack();
      }
    }
  }

  attack() {
    if (!controller.player.isDead){
      controller.player.currentHealth -= damage;
    }
  }

  void hit() {
    if(!isDead)
      health--;
    if (health <= 0) {
      isDead = true;
      controller.score++;
    }
  }
}
