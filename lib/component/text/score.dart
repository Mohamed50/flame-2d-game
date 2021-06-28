import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/game-controller.dart';

class Score {
  final GameController controller;
  TextPainter painter;
  Offset position;

  Score(this.controller) {
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
    if ((painter.text ?? '') != controller.playingView.score.toString()) {
      painter.text = TextSpan(
          text: controller.playingView.score.toString(),
          style: TextStyle(
            fontSize: 70,
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
