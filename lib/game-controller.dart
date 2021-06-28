import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/component/player/player.dart';
import 'package:flutter_game/state/game-state.dart';
import 'package:flutter_game/views/credit-view.dart';
import 'package:flutter_game/views/help-view.dart';
import 'package:flutter_game/views/home-view.dart';
import 'package:flutter_game/views/playing-view.dart';
import 'component/background.dart';
import 'views/lost-view.dart';

class GameController extends Game {
  GameState gameState;
  Size screenSize;
  double tileSize;
  Background background;
  Player player;
  HomeView homeView;
  PlayingView playingView;
  LostView lostView;
  HelpView helpView;
  CreditView creditView;

  GameController() {
    init();
  }

  Future<void> init() async {
    gameState = GameState.Menu;
    resize(await Flame.util.initialDimensions());
    homeView = HomeView(this);
    lostView = LostView(this);
    helpView = HelpView(this);
    creditView = CreditView(this);
    background = Background(this);
    Flame.audio.loopLongAudio('bg/bg.mp3', volume: 0.25);
    initPlaying();
  }

  initPlaying() {
    player = Player(this);
    playingView = PlayingView(this);
  }

  lost() {
    gameState = GameState.Lost;
    initPlaying();
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);
    player.render(canvas);
    switch (gameState) {
      case GameState.Menu:
        homeView.render(canvas);
        break;
      case GameState.Help:
        helpView.render(canvas);
        break;
      case GameState.Credit:
        creditView.render(canvas);
        break;
      case GameState.Lost:
        lostView.render(canvas);
        break;
      case GameState.Playing:
        playingView.render(canvas);
        break;
    }
  }

  @override
  void update(double t) {
    switch (gameState) {
      case GameState.Menu:
        break;
      case GameState.Help:
        break;
      case GameState.Credit:
        break;
      case GameState.Lost:
        lostView.update(t);
        break;
      case GameState.Playing:
        playingView.update(t);
        player.update(t);
        break;
    }
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails details) {
    switch (gameState) {
      case GameState.Menu:
        homeView.onTapDown(details);
        break;
      case GameState.Help:
        helpView.onTapDown(details);
        break;
      case GameState.Credit:
        creditView.onTapDown(details);
        break;
      case GameState.Lost:
        lostView.onTapDown(details);
        break;
      case GameState.Playing:
        playingView.onTapDown(details);
        break;
    }
  }

}
