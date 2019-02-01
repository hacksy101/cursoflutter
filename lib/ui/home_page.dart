import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Center(child: Text("Drawer")),
      ),
      endDrawer: Drawer(
        child: Center(child: Text("EndDrawer")),
      ),
      appBar: AppBar(
        title: Text("Mi Primera App"),
        actions: <Widget>[
          InkWell(
            onTap: () {
              print("Hola mundo");
            },
            child: Icon(Icons.home),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Adios mundo");
        },
        child: Icon(Icons.adb),
      ),
      body: Column(
        children: <Widget>[
          Text(
            "Mi primera app",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          RaisedButton(
            child: Text("Login"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}