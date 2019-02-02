import 'package:flutter/material.dart';

class AnimationWidgetScreen extends AnimatedWidget {
  AnimationWidgetScreen({Animation<double> animation})
      : super(listenable: animation);

  static final _sizeTween = Tween<double>(begin: 0, end: 1000);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        height: _sizeTween.evaluate(animation),
        width: _sizeTween.evaluate(animation),
        child: FlutterLogo(),
      ),
    );
  }
}
