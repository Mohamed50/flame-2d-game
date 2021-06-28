import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_game/game-controller.dart';

class Fly {
  final GameController controller;
  Rect flyRect;
  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0.0;
  bool isDead = false;
  bool isOffScreen = false;
  double get speed => controller.tileSize * 3;

  Fly(this.controller);

  void render(Canvas canvas) {
    if (isDead) {
      deadSprite.renderRect(canvas, flyRect.inflate(2));
    } else {
      if (flyingSpriteIndex >= 2)
        flyingSpriteIndex = 0;
        flyingSprite[flyingSpriteIndex.toInt()].renderRect(canvas, flyRect.inflate(2));
    }
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, controller.tileSize * 12 * t);
      if (flyRect.top > controller.screenSize.height) {
        isOffScreen = true;
      }
    }
    else{
      updateFrame(t);
      move(t);
    }
  }

  // this method will change the flyingSpriteIndex value so the image of the fly will change every two frames to show the animation
  // if game run in 60 frame per seconds the t (time delta) value will be 0.1666
  updateFrame(double t){
    flyingSpriteIndex += 30 * t;
    if (flyingSpriteIndex >= 2) {
      flyingSpriteIndex -= 2;
    }
  }

  void move(double t) {
      double stepDistance = speed * t;
      Offset playerTarget = controller.player.playerRect.center - flyRect.center;
      if (stepDistance <= playerTarget.distance - controller.tileSize * 1.25) {
        Offset stepToPlayer = Offset.fromDirection(
          playerTarget.direction,
          stepDistance,
        );
        flyRect = flyRect.shift(stepToPlayer);
      }
      else{
        attack();
      }
  }

  attack() {
    if (!controller.player.isDead){
      controller.player.currentHealth -= 1;
    }
  }

  void hit() {
    isDead = true;
    Flame.audio.play('sfx/ouch' + (Random().nextInt(11) + 1).toString() + '.ogg');
    controller.playingView.score++;
  }

}
