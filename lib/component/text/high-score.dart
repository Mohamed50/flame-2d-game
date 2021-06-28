import 'package:flutter/material.dart';
import 'package:flutter_game/data/pref-manager.dart';
import 'package:flutter_game/game-controller.dart';

class HighScore {
  final GameController controller;
  TextPainter painter;
  Offset position;
  int highScoreValue;
  TextStyle _textStyle;

  HighScore(this.controller) {
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    _textStyle = TextStyle(
      color: Color(0xffffffff),
      fontSize: 48,
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
    highScoreValue = PrefManger.getInstance().getHighScore() ?? 0;
    if ((painter.text ?? '') != highScoreValue.toString()) {
      painter.text = TextSpan(
          text: "High Score: $highScoreValue",
          style: _textStyle);
      painter.layout();
      position = Offset(
        (controller.screenSize.width / 2) - (painter.width / 2),
        (controller.screenSize.height * 0.2) - (painter.height / 2),
      );
    }
  }

}
