import 'package:flutter/material.dart';

class TransformWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: 0.2,
        child: Transform.rotate(
          angle: 12.0,
          child: Transform.translate(
            child: Container(
              height:100,
              width:100,
              child: FlutterLogo(
              ),
            ),
            offset: Offset(50,50),
          ),
        ),
      ),
    );
  }
}
