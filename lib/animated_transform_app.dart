import 'package:flutter/material.dart';

class AnimatedTransformApp extends StatefulWidget {
  @override
  AnimatedTransformAppState createState() {
    return new AnimatedTransformAppState();
  }
}

class AnimatedTransformAppState extends State<AnimatedTransformApp>
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
    return Transform.scale(
      scale: animation.value/200,
      child: Transform.rotate(
        angle: animation.value/80,
        child: Transform.translate(
          child: Scaffold(
            appBar: AppBar(title:Text("Animaciones")),
            body: Center(
              child: Container(
                height:100,
                width:100,
                child: FlutterLogo(
                ),
              ),
            ),
          ),
          offset: Offset(animation.value/10,animation.value/10),
        ),
      ),
    );
  }
}
