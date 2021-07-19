import 'package:flutter/material.dart';
import 'package:flutter_shit/models/market.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shit/pages/market_tile.dart';

class MarketList extends StatefulWidget {
  const MarketList({Key key}) : super(key: key);

  @override
  _MarketListState createState() => _MarketListState();
}

class _MarketListState extends State<MarketList> {
  @override
  Widget build(BuildContext context) {

    final market = Provider.of<List<Market>>(context) ?? [];

    /*
    market.forEach((market) {
      print(market.name);
      print(market.apartment);
      print(market.phone);
    });
    */

    //print(market.documents);
    //for(var doc in market.documents){
    //  print(doc.data);
    //}

    return ListView.builder(
      itemCount: market.length,
      itemBuilder: (context, index) {
        return MarketTile(market: market[index]);
      },
    );
  }
}
