import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/game-controller.dart';

class Score {
  final GameController controller;
  TextPainter painter;
  Offset position;
  TextStyle _textStyle;

  Score(this.controller) {
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    _textStyle = TextStyle(
      color: Color(0xffffffff),
      fontSize: 90,
      shadows: <Shadow>[
        Shadow(
          blurRadius: 7,
          color: Color(0xff000000),
          offset: Offset(3, 3),
        ),
      ],
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
        style: _textStyle,
      );
      painter.layout();
      position = Offset(
        (controller.screenSize.width / 2) - (painter.width / 2),
        (controller.screenSize.height * 0.2) - (painter.height / 2),
      );
    }
  }
}
