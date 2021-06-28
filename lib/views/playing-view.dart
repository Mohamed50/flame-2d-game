import 'dart:math';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter_game/component/enemy-spawner.dart';
import 'package:flutter_game/component/flies/agile-fly.dart';
import 'package:flutter_game/component/flies/drooler-fly.dart';
import 'package:flutter_game/component/flies/house-fly.dart';
import 'package:flutter_game/component/flies/hungry-fly.dart';
import 'package:flutter_game/component/flies/macho-fly.dart';
import 'package:flutter_game/component/flies/fly.dart';
import 'package:flutter_game/component/player/health-bar.dart';
import 'package:flutter_game/component/text/score.dart';
import 'package:flutter_game/game-controller.dart';

class PlayingView{

  final GameController controller;
  Random random;
  List<Fly> enemies;
  HealthBar healthBar;
  EnemySpawner enemySpawner;
  Score scoreText;
  int score;

  PlayingView(this.controller){
    random = Random();
    enemies = <Fly>[];
    healthBar = HealthBar(controller);
    enemySpawner = EnemySpawner(controller);
    score = 0;
    scoreText = Score(controller);
  }


  void render(Canvas canvas){
    enemies.forEach((enemy) => enemy.render(canvas));
    scoreText.render(canvas);
    healthBar.render(canvas);
  }

  void update(double t){
    enemies.forEach((enemy) => enemy.update(t));
    healthBar.update(t);
    enemySpawner.update(t);
    scoreText.update(t);
  }

  void onTapDown(TapDownDetails details) {
    enemies.forEach((enemy) {
      if (enemy.flyRect.contains(details.globalPosition)) enemy.hit();
    });
  }

  void spawnEnemy() {
    double x = random.nextDouble() * (controller.screenSize.width - (controller.tileSize * 1.5 * 1.35));
    double y = random.nextDouble() * (controller.screenSize.height - (controller.tileSize * 1.5 * 1.35));
    addRandomFly(x, y);
  }

  addRandomFly(double x, double y) {
    switch (random.nextInt(5)) {
      case 0:
        enemies.add(HouseFly(controller, x, y));
        break;
      case 1:
        enemies.add(DroolerFly(controller, x, y));
        break;
      case 2:
        enemies.add(AgileFly(controller, x, y));
        break;
      case 3:
        enemies.add(MachoFly(controller, x, y));
        break;
      case 4:
        enemies.add(HungryFly(controller, x, y));
        break;
    }
  }

}