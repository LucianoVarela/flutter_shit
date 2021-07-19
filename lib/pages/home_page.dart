import 'package:flutter/material.dart';
import 'package:flutter_shit/services/auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../StartEveryThing.dart';
import '../constants.dart';
import 'main_category_1.dart';
import '/services/auth.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 5,
        /*leading: IconButton(
          icon: Icon(Icons.expand_less),
          color: Colors.grey,
          //Button must be async to signOut
          onPressed: () async {
            await _auth.signOut();
            Navigator.push(context, MaterialPageRoute(builder: (context) => Authenticate()));
          },
        ),*/
        title: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.title,
            children: [
              TextSpan(
                text: "Market",
                style: TextStyle(color: Colors.green, fontFamily: "comfortaa", fontSize: 20, fontWeight: FontWeight.w900),
              ),
              TextSpan(
                text: "Town",
                style: TextStyle(color: Colors.grey, fontFamily: "comfortaa", fontSize: 20),
              ),
            ],
          ),
        ),
        actions: <Widget>[IconButton(onPressed: null, icon: Icon(Icons.notifications))],
      ),
      body: Stack(
          children: <Widget>[
        Container(
          height: 350,
          decoration: BoxDecoration(
            color: Color(0xFFF5CEB8),
            image: DecorationImage(
              alignment: Alignment.centerLeft,
              image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                Text("Putas harry, \nlas negras 2x1",
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(fontWeight: FontWeight.w900, fontFamily: "comfortaa"),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29.5),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      icon: SvgPicture.asset("assets/icons/search.svg"),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: <Widget>[
                      CategoryCard(title: "Restaurants", SvgScr: "assets/icons/Hamburger.svg", press: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Category1()));
                      },),
                      CategoryCard(title: "Markets", SvgScr: "assets/icons/yoga.svg", press: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Category2()));
                        },),
                      CategoryCard(title: "Coffee shops", SvgScr: "assets/icons/yoga.svg", press: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Category3()));
                      },),
                      CategoryCard(title: "Stores", SvgScr: "assets/icons/yoga.svg", press: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Category4()));
                      },),
                      CategoryCard(title: "Services", SvgScr: "assets/icons/yoga.svg", press: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Category5()));
                      },),
                      CategoryCard(title: "Other", SvgScr: "assets/icons/Meditation_women_small.svg",),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class ButtonNavItems extends StatelessWidget {
  final String SvgSrc;
  final String title;
  final Function press;
  final bool isActive;
  const ButtonNavItems({
    Key key,
    his,
    this.SvgSrc,
    this.title,
    this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(SvgSrc, color: isActive ? kActiveIconColor : kTextColor),
          Text(title, style: TextStyle(color: isActive ? kActiveIconColor : kTextColor, fontFamily: "comfortaa")),
        ],),
    );
  }
}

/*
Align(
alignment: Alignment.topRight,
child: Container(
alignment: Alignment.center,
height: 52,
width: 52,
decoration: BoxDecoration(
color: Color(0xFFF2BEA1),
shape: BoxShape.circle,
),
child: SvgPicture.asset("assets/icons/menu.svg"),
),
),
*/