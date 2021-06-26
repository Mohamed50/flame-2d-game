import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/game-controller.dart';

class HighScore {
  final GameController controller;
  TextPainter painter;
  Offset position;

  HighScore(this.controller) {
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
    if ((painter.text ?? '') != controller.highScoreValue.toString()) {
      painter.text = TextSpan(
          text: "High Score: ${controller.highScoreValue}",
          style: TextStyle(
            fontSize: 48,
            color: Colors.black,
          ));
      painter.layout();
      position = Offset(
        (controller.screenSize.width / 2) - (painter.width / 2),
        (controller.screenSize.height * 0.2) - (painter.height / 2),
      );
    }
  }
}
