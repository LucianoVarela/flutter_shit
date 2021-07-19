import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        elevation: 5,
        title: Column(
          children: [Text(
            "Favorites",
            style: TextStyle(color: Colors.green, fontFamily: "comfortaa", fontSize: 24),
          ),
            Text("4 items", style: TextStyle(color: Colors.grey, fontFamily: "comfortaa", fontSize: 16),),
          ],
        ),
        bottomOpacity: 0.0,
        centerTitle: true,
        actions: <Widget>[
        ],
      ),
    );
  }
}

class Loginn extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        elevation: 5,
        title: Column(
          children: [Text(
            "Favorites",
            style: TextStyle(color: Colors.green, fontFamily: "comfortaa", fontSize: 24),
          ),
            Text("4 items", style: TextStyle(color: Colors.grey, fontFamily: "comfortaa", fontSize: 16),),
          ],
        ),
        bottomOpacity: 0.0,
        centerTitle: true,
        actions: <Widget>[
        ],
      ),
    );
  }
}
