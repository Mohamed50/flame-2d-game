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
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  update(t){
    int now = DateTime.now().millisecondsSinceEpoch;
    if(controller.playingView.enemies.length < maxEnemies && now >= nextSpawn){
      controller.playingView.spawnEnemy();
      if(currentInterval > minSpawnInterval){
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * 0.1).toInt();
      }
      nextSpawn = now + currentInterval;
    }
  }

}