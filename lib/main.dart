import 'package:flutter/material.dart';
import 'package:flutter_shit/pages/Primera.dart';
import 'package:flutter_shit/services/auth.dart';
//import 'package:provider/provider.dart';
import 'StartEveryThing.dart';
import 'package:splashscreen/splashscreen.dart';
import '/pages/signup.dart';
import '/pages/wrapper.dart';
import 'constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shit/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: "Comfortaa",
            scaffoldBackgroundColor: kBackgroundColor,
            textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
          ),
          home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      backgroundColor: Colors.white,
      image: Image.asset("assets/images/Animation.gif"),
      loaderColor: Colors.white,
      photoSize: 250,
      navigateAfterSeconds: PrimeraScreen(),
    );
  }
}
