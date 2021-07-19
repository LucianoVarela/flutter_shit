import 'package:flutter/material.dart';
import 'package:flutter_shit/pages/authenticate/register.dart';
import 'package:flutter_shit/pages/signup.dart';
import 'package:flutter_shit/services/auth.dart';
import '../StartEveryThing.dart';
import 'authenticate/reg.dart';
import 'home_page.dart';

class PrimeraScreen extends StatefulWidget {
  const PrimeraScreen({Key key}) : super(key: key);

  @override
  _PrimeraScreenState createState() => _PrimeraScreenState();
}

class _PrimeraScreenState extends State<PrimeraScreen> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child:
                    Text(
                        "Market",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 70.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "comfortaa",)
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15.0, 180.0, 0.0, 0.0),
                    child:
                    Text(
                        "Town",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 70.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Comfortaa",)
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 120.0,),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                    },
                    child: Container(
                      height: 70.0,
                      width: 280.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(30.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 10.0,
                          child: Center(
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "comfortaa",
                                fontSize: 30,
                              ),
                            ),
                          ),
                      ),
                    ),
                  ),
                ),
                //SizedBox(height: 50.0,),
              ],
            ),
          ),
          SizedBox(height: 15.0,),
          Center(
            child: GestureDetector(
              onTap: () async{
                dynamic result = await _auth.signInAnon();
                if(result == null){
                  print('error signing in');
                } else{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                }
              },
              child: Container(
                height: 70.0,
                width: 280.0,
                child: Material(
                  borderRadius: BorderRadius.circular(30.0),
                  shadowColor: Colors.greenAccent,
                  color: Colors.green,
                  elevation: 10.0,
                    child: Center(
                      child: Text(
                        "Sign In Anonymously",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "comfortaa",
                          fontSize: 25,
                        ),
                      ),
                    ),

                ),
              ),
            ),
          ),
          SizedBox(height: 40.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("New?",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "comfortaa",
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 10.0,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                },
                child: Text("Sign Up",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontFamily: "comfortaa",
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
