import 'package:flutter/material.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
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
            "Wishlist",
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
