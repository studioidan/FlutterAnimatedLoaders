import 'dart:math';

import 'package:flutter/material.dart';

class ZigZag extends StatefulWidget {
  Color _color1, _color2;
  double _size;

  ZigZag(this._size, this._color1, this._color2);

  @override
  ZigZagState createState() => new ZigZagState();
}

class ZigZagState extends State<ZigZag> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation1 = Tween<double>(begin: -2 * pi, end: 2 * pi)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) _controller.reverse();
            if (status == AnimationStatus.dismissed) _controller.forward();
          })
          ..addListener(() => setState(() {}));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var mult = widget._size / pi / 4;
    var amp = 30.0;
    return new Container(
        height: widget._size,
        width: widget._size,
        //decoration: BoxDecoration(color: Colors.amber),
        child: Stack(children: <Widget>[
          Center(
            child: Transform.translate(
              offset: Offset(
                  _animation1.value * mult, sin(_animation1.value) * amp),
              child: getBall(widget._color1),
            ),
          ),
          Center(
            child: Transform.translate(
              offset: Offset(
                  _animation1.value * mult, sin(_animation1.value + pi) * amp),
              child: getBall(widget._color2),
            ),
          )
        ]));
  }

  getBall(Color color) {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
