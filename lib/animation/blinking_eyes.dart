import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class BlinkingEyes extends StatefulWidget {
  final size;
  final color;
  final duration = 200;

  BlinkingEyes(this.size, this.color);

  @override
  BlinkingEyesState createState() => new BlinkingEyesState();
}

class BlinkingEyesState extends State<BlinkingEyes>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration));

    _sizeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) _controller.reverse();
        // if (status == AnimationStatus.dismissed) _controller.forward();
      })
      ..addListener(() => setState(() {}));

    blink();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double circleSize = widget.size * 0.4;

    return new Center(
      child: new Container(
        height: widget.size,
        width: widget.size,
        // decoration: new BoxDecoration(color: Colors.blueGrey),
        child: new Center(
            child: RotatedBox(
          quarterTurns: 2,
          child: new Transform(
              transform: Matrix4.identity()..scale(1.0, _sizeAnimation.value),
              child: new Row(
                children: <Widget>[
                  getCircle(circleSize, widget.color),
                  getCircle(circleSize, widget.color),
                ],
              )),
        )),
      ),
    );
  }

  void blink() {
    _controller.forward();
    new Timer(Duration(milliseconds: new Random().nextInt(2000)), () {
      blink();
    });
  }

  Widget getCircle(double height, Color c) {
    var circleSize = height * 0.4;
    return new Padding(
        padding: EdgeInsets.all(5.0),
        child: Stack(
          children: <Widget>[
            Container(
                height: height,
                width: height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: c,
                )),
            Positioned(
              left: height / 2 - circleSize / 2,
              top: height / 2 - circleSize / 2,
              child: Container(
                  height: circleSize,
                  width: circleSize,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black)),
            )
          ],
        ));
  }
}
