import 'dart:async';

import 'package:flutter/material.dart';

class PulseLoader extends StatefulWidget {
  Icon _icon;
  Color _rippleColor;

  PulseLoader(this._icon, this._rippleColor);

  @override
  PulseLoaderState createState() => new PulseLoaderState();
}

class PulseLoaderState extends State<PulseLoader>
    with TickerProviderStateMixin {
  AnimationController _controller1,
      _controller2,
      _controller3,
      _alphaController1,
      _alphaController2,
      _alphaController3;

  Animation _alphaAnimation1, _alphaAnimation2, _alphaAnimation3;

  Animation _scaleAnimation1, _scaleAnimation2, _scaleAnimation3;

  @override
  void initState() {
    super.initState();

    var d = Duration(milliseconds: 2000);
    var tween = Tween(begin: 0.0, end: 1.4);

    _controller1 = AnimationController(vsync: this, duration: d);
    _controller2 = AnimationController(vsync: this, duration: d);
    _controller3 = AnimationController(vsync: this, duration: d);

    _alphaController1 = AnimationController(vsync: this, duration: d);
    _alphaController2 = AnimationController(vsync: this, duration: d);
    _alphaController3 = AnimationController(vsync: this, duration: d);

    _scaleAnimation1 = tween.animate(_controller1)
      ..addListener(() => setState(() {}));

    _scaleAnimation2 = tween.animate(
        CurvedAnimation(parent: _controller2, curve: Curves.easeInOut));

    _scaleAnimation3 = tween.animate(
        CurvedAnimation(parent: _controller3, curve: Curves.easeInOut));

    _alphaAnimation1 = new Tween(begin: 0.9, end: 0.0).animate(
        CurvedAnimation(parent: _alphaController1, curve: Curves.easeOut));
    _alphaAnimation2 = new Tween(begin: 0.9, end: 0.0).animate(
        CurvedAnimation(parent: _alphaController2, curve: Curves.easeOut));
    _alphaAnimation3 = new Tween(begin: 0.9, end: 0.0).animate(
        CurvedAnimation(parent: _alphaController3, curve: Curves.easeOut));

    print('started  animation');
    _controller1.repeat();
    _alphaController1.repeat();

    new Timer(Duration(milliseconds: 400), () {
      _controller2.repeat();
      _alphaController2.repeat();
    });

    new Timer(Duration(milliseconds: 800), () {
      _controller3.repeat();
      _alphaController3.repeat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        //decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
        child: new Center(
      child: new Stack(
        children: <Widget>[
          Opacity(
              opacity: 0.4 * _alphaAnimation1.value,
              child: Transform.scale(
                scale: _scaleAnimation1.value,
                child: new Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: widget._rippleColor)),
              )),
          Opacity(
              opacity: 0.4 * _alphaAnimation2.value,
              child: Transform.scale(
                scale: _scaleAnimation2.value,
                child: new Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: widget._rippleColor)),
              )),
          Opacity(
              opacity: 0.4 * _alphaAnimation3.value,
              child: Transform.scale(
                scale: _scaleAnimation3.value,
                child: new Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: widget._rippleColor)),
              )),
          new Center(child: widget._icon),
        ],
      ),
    ));
  }
}
