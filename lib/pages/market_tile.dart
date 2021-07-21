import 'package:flutter/material.dart';
import 'package:flutter_shit/models/market.dart';

class MarketTile extends StatelessWidget {
  final Market market;
  MarketTile({this.market});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[market.phone],
            backgroundImage: AssetImage("assets/images/cup.png"),
          ),
          title: Text(market.name),
          subtitle: Text('${market.phone}'),
        ),
      ),
    );
  }
}
