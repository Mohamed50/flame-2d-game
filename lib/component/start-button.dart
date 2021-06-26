import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_game/game-controller.dart';
import 'package:flutter_game/state/game-state.dart';

class StartButton {
  final GameController controller;
  TextPainter painter;
  Offset position;

  StartButton(this.controller) {
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    position = Offset.zero;
  }

  void render(Canvas canvas) {
    painter.paint(canvas, position);
  }

  void update(double t) {
    if ((painter.text ?? '') != "Start") {
      painter.text = TextSpan(
          text: "Start",
          style: TextStyle(
            fontSize: 70,
            color: Colors.black,
          ));
      painter.layout();
      position = Offset(
        (controller.screenSize.width / 2) - (painter.width / 2),
        (controller.screenSize.height * 0.8) - (painter.height / 2),
      );
    }
  }

  void onTapDown(TapDownDetails details){
    if(details.globalPosition == position){
      controller.gameState = GameState.Playing;
    }
  }

}
