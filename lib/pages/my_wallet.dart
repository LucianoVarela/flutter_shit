import 'package:flutter/material.dart';

class MyWallet extends StatefulWidget {
  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
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
            "My Wallet",
            style: TextStyle(color: Colors.green, fontFamily: "comfortaa", fontSize: 24),
          ),
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
