import 'package:flutter/material.dart';
import 'package:flutter_shit/models/market.dart';
import 'package:flutter_shit/pages/settings_form.dart';
import 'package:flutter_shit/services/auth.dart';
import 'package:flutter_shit/services/database.dart';
import 'package:provider/provider.dart';
import 'market_list.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    //First kind of passing data as an StreamProvider
    return StreamProvider<List<Market>>.value(
      //This value gets the data when is uploaded at settings format dynamicly. recycle.
      value: DatabaseService().shops,
      child: Scaffold(
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
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/cafe.png"),
            ),
          ),
            child: MarketList()
        ),
      ),
    );
  }
}

