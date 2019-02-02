import 'package:flutter/material.dart';

class AnimatedTransformScreen extends StatefulWidget {
  @override
  AnimatedTransformScreenState createState() {
    return new AnimatedTransformScreenState();
  }
}

class AnimatedTransformScreenState extends State<AnimatedTransformScreen>
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
      child: Transform.scale(
        scale: animation.value/200,
        child: Transform.rotate(
          angle: animation.value/80,
          child: Transform.translate(
            child: Container(
              height:100,
              width:100,
              child: FlutterLogo(
              ),
            ),
            offset: Offset(animation.value/10,animation.value/10),
          ),
        ),
      ),
    );
  }
}
