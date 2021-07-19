
import 'package:flutter/material.dart';
import 'package:flutter_shit/models/user.dart';
import '../StartEveryThing.dart';
import 'authenticate/authenticate.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    //return either HomePage or Authenticate widget
    //return Authenticate();

    //check if the user exists
    if(user == null){
      return Authenticate();
    } else{
      return HomeScreen();
    }
  }
}
