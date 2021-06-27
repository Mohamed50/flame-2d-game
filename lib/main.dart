import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'game-controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.images.loadAll(<String>[
    'bg/backyard.png',
    'flies/agile-fly-1.png',
    'flies/agile-fly-2.png',
    'flies/agile-fly-dead.png',
    'flies/drooler-fly-1.png',
    'flies/drooler-fly-2.png',
    'flies/drooler-fly-dead.png',
    'flies/house-fly-1.png',
    'flies/house-fly-2.png',
    'flies/house-fly-dead.png',
    'flies/hungry-fly-1.png',
    'flies/hungry-fly-2.png',
    'flies/hungry-fly-dead.png',
    'flies/macho-fly-1.png',
    'flies/macho-fly-2.png',
    'flies/macho-fly-dead.png',
  ]);
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
  GameController gameController = GameController();
  runApp(gameController.widget);

  TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();
  tapGestureRecognizer.onTapDown = gameController.onTapDown;
  flameUtil.addGestureRecognizer(tapGestureRecognizer);
}
