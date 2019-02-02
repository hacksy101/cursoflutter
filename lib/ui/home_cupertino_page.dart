import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCupertinoPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Mi primera App"),
        trailing: GestureDetector(
          child: Icon(Icons.adb),
          onTap: () {
            print("Hola mundo");
          },
        ),
      ),
      child: Container(color: Colors.red),
    );
  }
}
