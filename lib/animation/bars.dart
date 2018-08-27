import 'package:flutter/material.dart';

class Bars extends StatefulWidget {
  final size;
  final color;
  final duration;

  Bars(this.size, this.color, {this.duration = 900});

  @override
  BarsState createState() => new BarsState();
}

class BarsState extends State<Bars> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration));

    _animation = Tween(begin: 0.4, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) _controller.reverse();
            if (status == AnimationStatus.dismissed) _controller.forward();
          })
          ..addListener(() => setState(() {}));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Container(
        height: widget.size,
        decoration: new BoxDecoration(),
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            getBar(getNormalHeight(widget.size * _animation.value)),
            getBar(getNormalHeight(widget.size * _animation.value + 10)),
            getBar(getNormalHeight(widget.size * _animation.value + 20)),
            getBar(getNormalHeight(widget.size * _animation.value + 30)),
            getBar(getNormalHeight(widget.size * _animation.value + 40))
          ],
        ),
      ),
    );
  }

  double getNormalHeight(double h) {
    if (h < widget.size) {
      return h;
    }
    return widget.size - (h - widget.size);
  }

  Widget getBar(double height) {
    return new Container(
      height: height,
      width: 7.0,
      margin: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(4.0)),
    );
  }
}
