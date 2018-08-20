library flutter_animated_loaders;

import 'package:flutter/material.dart';
import 'package:flutter_animated_loaders/animation/Pulse.dart';

class FlutterLoaders {
  static Widget Pulse(Icon icon, Color rippleColor) {
    return PulseLoader(icon, rippleColor);
  }
}
