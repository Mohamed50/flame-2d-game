import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/component/enemy-spawner.dart';
import 'package:flutter_game/component/flies/house-fly.dart';
import 'package:flutter_game/component/health-bar.dart';
import 'package:flutter_game/component/high-score.dart';
import 'package:flutter_game/component/player.dart';
import 'package:flutter_game/component/score.dart';
import 'package:flutter_game/state/game-state.dart';
import 'package:flutter_game/views/home-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'component/background.dart';
import 'component/flies/agile-fly.dart';
import 'component/flies/drooler-fly.dart';
import 'component/flies/hungry-fly.dart';
import 'component/flies/macho-fly.dart';
import 'component/fly.dart';

class GameController extends Game{
  Random random;
  SharedPreferences storage;
  GameState gameState;
  Size screenSize;
  double tileSize;
  Player player;
  Background background;
  List<Fly> enemies;
  HealthBar healthBar;
  EnemySpawner enemySpawner;
  Score scoreText;
  HighScore highScore;
  int score;
  int highScoreValue;
  HomeView homeView;

  GameController(){
    init();
  }
  
  Future<void> init() async {
    gameState = GameState.Menu;
    random = Random();
    resize(await Flame.util.initialDimensions());
    homeView = HomeView(this);
    background = Background(this);
    player = Player(this);
    highScore = HighScore(this);
    enemies = <Fly>[];
    healthBar = HealthBar(this);
    enemySpawner = EnemySpawner(this);
    score = 0;
    scoreText = Score(this);
    storage = await SharedPreferences.getInstance();
    highScoreValue = storage.getInt("highScore") ?? 0;
  }
  
  
  
  @override
  void render(Canvas canvas) {
    background.render(canvas);
    player.render(canvas);
    if(gameState == GameState.Menu){
      homeView.render(canvas);
      highScore.render(canvas);
    }
    else {
      enemies.forEach((enemy) => enemy.render(canvas));
      scoreText.render(canvas);
      healthBar.render(canvas);
    }
  }

  @override
  void update(double t) {
    if(gameState == GameState.Menu) {
      highScore.update(t);
    }
    else {
      enemies.forEach((enemy) => enemy.update(t));
      player.update(t);
      healthBar.update(t);
      enemySpawner.update(t);
      scoreText.update(t);
    }
  }
  
  void resize(Size size){
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails details){
    if(gameState == GameState.Menu)
      homeView.onTapDown(details);
    else {
      enemies.forEach((enemy) {
        if (enemy.flyRect.contains(details.globalPosition))
          enemy.hit();
      });
    }
  }

  void spawnEnemy(){
    double x = random.nextDouble() * (screenSize.width - (tileSize * 1.5 * 1.35));
    double y = random.nextDouble() * (screenSize.height - (tileSize * 1.5 * 1.35));
    addRandomFly(x, y);
  }

  addRandomFly(double x, double y){
    switch(random.nextInt(5)){
      case 0:
        enemies.add(HouseFly(this, x, y));
        break;
      case 1:
        enemies.add(DroolerFly(this, x, y));
        break;
      case 2:
        enemies.add(AgileFly(this, x, y));
        break;
      case 3:
        enemies.add(MachoFly(this, x, y));
        break;
      case 4:
        enemies.add(HungryFly(this, x, y));
        break;
    }
  }

}