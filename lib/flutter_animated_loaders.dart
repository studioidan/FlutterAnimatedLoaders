library flutter_animated_loaders;

import 'package:flutter/material.dart';
import 'package:flutter_animated_loaders/animation/bars.dart';
import 'package:flutter_animated_loaders/animation/blinking_eyes.dart';
import 'package:flutter_animated_loaders/animation/four_balls.dart';
import 'package:flutter_animated_loaders/animation/ping_pong.dart';
import 'package:flutter_animated_loaders/animation/pulse.dart';
import 'package:flutter_animated_loaders/animation/zig_zag.dart';

class FlutterLoaders {
  static Widget pulse(Icon icon, Color rippleColor) {
    return PulseLoader(icon, rippleColor);
  }

  static Widget blinkingEyes(double size, Color color) {
    return BlinkingEyes(size, color);
  }

  static Widget bars(double size, Color color) {
    return Bars(size, color);
  }

  static Widget pingPong(double size, Color color) {
    return PingPong(size, color);
  }

  static Widget fourBalls(Color ballColor_1, Color ballColor_2,
      Color ballColor_3, Color ballColor_4) {
    return FourBalls(ballColor_1, ballColor_2, ballColor_3, ballColor_4);
  }

  static Widget zigZag(double size, Color ballColor_1, Color ballColor_2) {
    return ZigZag(size, ballColor_1, ballColor_2);
  }
}
