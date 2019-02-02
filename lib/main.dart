import 'package:animations/animacion_screen.dart';
import 'package:animations/animated_transform_app.dart';
import 'package:animations/animated_transform_screen.dart';
import 'package:animations/animation_second_screen.dart';
import 'package:animations/transform_screen.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlareAnimation(),
    );
  }
}

class AnimatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animaciones")),
      body: AnimatedTransformScreen(),
    );
  }
}

class AnimatedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedTransformApp();
  }
}

class FlareAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height:100,
          width: 100,
          child: FlareActor(
            "assets/curso_flutter.flr",
            animation: "animation2",

          ),
        ),
        Image.asset("assets/cancel_.png"),
      ],
      ),
    );
  }
}
