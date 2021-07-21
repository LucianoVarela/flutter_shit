import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:flutter_shit/constants.dart';
import 'package:flutter_shit/pages/map_page.dart';
import 'package:flutter_shit/pages/register_anon_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/my_cart.dart';
import 'package:splashscreen/splashscreen.dart';


void main() {
  runApp(Start());
}

class Start extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Comfortaa",
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
        ),
        home: HomeScreenAnon(),
        routes: {
          HomePage.routeName: (ctx)=> HomePage(),
        }
    );
  }
}

class HomeScreenAnon extends StatefulWidget {
  @override
  _HomeScreenAnonState createState() => _HomeScreenAnonState();
}

class _HomeScreenAnonState extends State<HomeScreenAnon> {
  int pageindex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pagelist = <Widget> [
      HomePage(),
      MapPage(),
      Cart(),
      RegisterAnon(),
    ];
    var size = MediaQuery.of(context).size; // give height and with from device
    return Scaffold(
      body: pagelist[pageindex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 50.0,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex:  pageindex,
        onTap: (value) {
          setState(() {
            pageindex = value;
          });
        },
        unselectedIconTheme: IconThemeData(color: Colors.grey, size: 24),
        unselectedLabelStyle: TextStyle(color: Colors.grey[400]),
        selectedIconTheme: IconThemeData(color: Colors.green, size: 30),
        selectedLabelStyle: TextStyle(color: Colors.green[600]),
        backgroundColor: Colors.white,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            title: Text("Shop", style: TextStyle(color: Colors.green, fontFamily: "Comfortaa"),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text("Map", style: TextStyle(color: Colors.green, fontFamily: "Comfortaa"),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("Cart", style: TextStyle(color: Colors.green, fontFamily: "Comfortaa"),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile", style: TextStyle(color: Colors.green, fontFamily: "Comfortaa"),),
          ),
        ],
      ),
    );
  }
}


class CategoryCard extends StatelessWidget {
  final String SvgScr;
  final String title;
  final Function press;
  const CategoryCard({
    Key key, this.SvgScr, this.title, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [BoxShadow(offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor,
            )
              ,]
        ),
        //padding: EdgeInsets.all(20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  SvgPicture.asset(SvgScr),
                  Spacer(),
                  Text(title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 15),)
                  ,]
                ,),
            ),
          ),
        )
        ,),
    );
  }
}