import 'package:animations/animation_widget_screen.dart';
import 'package:flutter/material.dart';

class AnimationSecondScreen extends StatefulWidget {
  @override
  AnimationSecondScreenState createState() {
    return new AnimationSecondScreenState();
  }
}

class AnimationSecondScreenState extends State<AnimationSecondScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    animation = CurvedAnimation(
      curve: Curves.easeIn,
      parent: controller,
    );
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimationWidgetScreen(animation: animation);
  }
}
