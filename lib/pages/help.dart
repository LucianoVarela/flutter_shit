import 'package:flutter/material.dart';

class help extends StatefulWidget {
  @override
  _helpState createState() => _helpState();
}

class _helpState extends State<help> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        elevation: 5,
        title: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.title,
            children: [
              TextSpan(
                text: "Help",
                style: TextStyle(color: Colors.grey, fontFamily: "comfortaa", fontSize: 24),
              ),
            ],
          ),
        ),
        actions: <Widget>[IconButton(onPressed: null, icon: Icon(Icons.notifications))],
      ),
    );
  }
}
