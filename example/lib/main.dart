import 'package:flutter/material.dart';
import 'package:flutter_animated_loaders/flutter_animated_loaders.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Animated Loaders'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
          child: new GridView.count(
        crossAxisCount: 3,
        children: <Widget>[
          FlutterLoaders.pulse(
              Icon(
                Icons.check_circle,
                color: Colors.blue,
                size: 50.0,
              ),
              Colors.blue),
          FlutterLoaders.blinkingEyes(60.0, Colors.black26),
          FlutterLoaders.bars(60.0, Colors.red),
          FlutterLoaders.pingPong(60.0, Colors.deepOrange),
          FlutterLoaders.fourBalls(
              Colors.blue, Colors.green, Colors.red, Colors.yellow),
          FlutterLoaders.zigZag(100.0, Colors.blue, Colors.green),
        ],
      )),
    );
  }
}
