# flutter animated loaders

>Amazing animated loaders for flutter developers


## Preview

<img src="https://github.com/studioidan/FlutterAnimatedLoaders/blob/master/art/screen.gif" width="340px" />

# How to use
 1. Add this to your package's pubspec.yaml file:

````dart
dependencies:
  flutter_animated_loaders: ^0.0.2
  ````
  
 2. Add this import to your dart file:

````dart
import 'package:flutter_animated_loaders/flutter_animated_loaders.dart';
  ````

 3. Select your favorite loader and add it as a widget!
 you can customise it however you like!
 
 ````dart
 FlutterLoaders.pulse(
              Icon(
                Icons.android,
                color: Colors.green,
                size: 40.0,
              ),
              Colors.green)
  ````
 
 ## this table will make your life mutch easier...


Loader name | Preview | Usage | Comments
------------     |   -------------   |    ------------    |    ------------
Pulse    | <img src='https://github.com/studioidan/FlutterAnimatedLoaders/blob/master/art/pulse.gif' alt='Pulse' width="90px" height="90px"/> | ````dart FlutterLoaders.pulse(<br>Icon(<br>Icons.check_circle, <br>color: Colors.blue, <br>size: 50.0, <br>), <br>Colors.blue)```` | You can choose any icon you want!
RotatingPlane    | <img src='https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/RotatingPlane.gif' alt='RotatingPlane' width="90px" height="90px"/> | some code | comments
RotatingPlane    | <img src='https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/RotatingPlane.gif' alt='RotatingPlane' width="90px" height="90px"/> | some code | comments





## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
