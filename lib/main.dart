import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  int _r = 255;
  int _g = 255;
  int _b = 255;
  double _o = 1;

  void _randomColor() {
    setState(() {
      Random r = new Random();
      _r = r.nextInt(255);
      _g = r.nextInt(255);
      _b = r.nextInt(255);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(_r, _g, _b, 1),
      appBar: AppBar(title: Text("Random Background Color")),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _randomColor(),
        onPanUpdate: (DragUpdateDetails details) {
          if (details.delta.dy > 0 && _o < 1) {
            setState(() {
              _o += 0.01;
            });
          } else if (details.delta.dy < 0 && _o > 0) {
            setState(() {
              _o -= 0.01;
            });
          }
        },
        child: Center(
          child: Text(
            "Hey there",
            style: TextStyle(
                fontSize: 25,
                color: Color.fromRGBO(255 - _r, 255 - _g, 255 - _b, _o)),
          ),
        ),
      ),
    );
  }
}
