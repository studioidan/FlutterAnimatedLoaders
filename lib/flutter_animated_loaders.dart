library flutter_animated_loaders;

import 'package:flutter/material.dart';
import 'package:flutter_animated_loaders/animation/blinking_eyes.dart';
import 'package:flutter_animated_loaders/animation/pulse.dart';

class FlutterLoaders {
  static Widget pulse(Icon icon, Color rippleColor) {
    return PulseLoader(icon, rippleColor);
  }

  static Widget blinkingEyes(double size, Color color) {
    return BlinkingEyes(size, color);
  }
}
