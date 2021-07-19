import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 5,
        leading: IconButton(
          icon: Icon(Icons.expand_less),
          color: Colors.grey,
          onPressed: () {},
        ),
        title: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.title,
            children: [
              TextSpan(
                text: "Market",
                style: TextStyle(
                    color: Colors.green,
                    fontFamily: "comfortaa",
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
              TextSpan(
                text: "Town",
                style: TextStyle(color: Colors.grey, fontFamily: "comfortaa", fontSize: 20),
              ),
              TextSpan(
                text: "Cart",
                style: TextStyle(color: Colors.grey, fontFamily: "comfortaa", fontSize: 16),
              ),
            ],
          ),
        ),
        actions: <Widget>[IconButton(onPressed: null, icon: Icon(Icons.notifications))],
      ),
    );
  }
}
