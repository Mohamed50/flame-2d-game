import 'package:flutter_game/game-controller.dart';

class EnemySpawner {
  final GameController controller;
  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 700;
  final int intervalChange = 3;
  final int maxEnemies = 1000;
  int currentInterval;
  int nextSpawn;

  EnemySpawner(this.controller){
    init();
  }

  void init(){
    killAllEnemies();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void killAllEnemies(){
    controller.enemies.forEach((element) => element.isDead = true);
  }

  update(t){
    int now = DateTime.now().millisecondsSinceEpoch;
    if(controller.enemies.length < maxEnemies && now >= nextSpawn){
      controller.spawnEnemy();
      if(currentInterval > minSpawnInterval){
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * 0.1).toInt();
      }
      nextSpawn = now + currentInterval;
    }
  }

}