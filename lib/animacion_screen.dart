import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  @override
  AnimationScreenState createState() {
    return new AnimationScreenState();
  }
}

class AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 500).animate(animationController);
    animation.addListener(() {
      setState(() {});
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}
