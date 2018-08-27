import 'dart:math';

import 'package:flutter/material.dart';

class PingPong extends StatefulWidget {
  final size;
  final color;
  final duration;

  PingPong(this.size, this.color, {this.duration = 1000});

  @override
  PingPongState createState() => new PingPongState();
}

class PingPongState extends State<PingPong>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration));

    _sizeAnimation = Tween<double>(begin: 0.0, end: 2 * pi).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) _controller.reverse();
        if (status == AnimationStatus.dismissed) _controller.forward();
      })
      ..addListener(() => setState(() {}));

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double r = widget.size / 2.0 * 0.7;
    double circleSize = 20.0;
    double x1 = r * cos(_sizeAnimation.value);
    double y1 = r * sin(_sizeAnimation.value);

    double x2 = (r) * cos(2 * pi - _sizeAnimation.value);
    double y2 = (r) * sin(2 * pi - _sizeAnimation.value);

    return new Center(
      child: new Container(
          height: widget.size,
          width: widget.size,
          //decoration: new BoxDecoration(color: Colors.blueGrey),
          child: new Center(
              child: new Stack(
            children: <Widget>[
              new Transform.translate(
                offset: Offset(x1, y1),
                child: getCircle(circleSize, widget.color),
              ),
              new Transform.translate(
                offset: Offset(x2, y2),
                child: getCircle(circleSize, widget.color),
              ),
            ],
          ))),
    );
  }

  Widget getCircle(double height, Color c) {
    return new Container(
        height: height,
        width: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: c,
        ));
  }
}
