import 'package:flutter/material.dart';

class FourBalls extends StatefulWidget {
  Color _color1, _color2, _color3, _color4;

  @override
  FourBallsState createState() => new FourBallsState();

  FourBalls(this._color1, this._color2, this._color3, this._color4);
}

class FourBallsState extends State<FourBalls> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation1, _animation2;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    var mult = 0.5;
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation1 = Tween<Offset>(
            begin: Offset(-1.0 * mult, -1.0 * mult),
            end: Offset(1.0 * mult, 1.0 * mult))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) _controller.reverse();
            if (status == AnimationStatus.dismissed) _controller.forward();
          })
          ..addListener(() => setState(() {}));

    _animation2 = Tween<Offset>(
            begin: Offset(1.0 * mult, -1.0 * mult),
            end: Offset(-1.0 * mult, 1.0 * mult))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      /*height: 100.0,
      width: 100.0,*/
      //decoration: BoxDecoration(color: Colors.amber),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(_animation1.value.dx, _animation1.value.dy),
            child: getBall(widget._color1),
          ),
          Align(
            alignment:
                Alignment(_animation1.value.dx * -1, _animation1.value.dy * -1),
            child: getBall(widget._color2),
          ),
          Align(
            alignment: Alignment(_animation2.value.dx, _animation2.value.dy),
            child: getBall(widget._color3),
          ),
          Align(
            alignment:
                Alignment(_animation2.value.dx * -1, _animation2.value.dy * -1),
            child: getBall(widget._color4),
          )
        ],
      ),
    );
  }

  getBall(Color color) {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
