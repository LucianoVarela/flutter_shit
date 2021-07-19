import 'package:flutter/material.dart';
import 'package:flutter_shit/shared/loading.dart';
import '../StartEveryThing.dart';
import 'package:flutter_shit/services/auth.dart';
import 'Primera.dart';
import 'authenticate/reg.dart';
import 'authenticate/register.dart';
import 'authenticate/sign_in.dart';

class SignUpScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email, password, error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top:25,
                  left:10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PrimeraScreen()));
                    },
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child:
                    Text(
                      "Welcome",
                      style:  TextStyle(
                          color: Colors.black,
                          fontSize: 60.0, fontWeight: FontWeight.bold, fontFamily: "comfortaa",)
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15.0, 180.0, 0.0, 0.0),
                    child:
                    Text(
                        "Neighbor",
                        style:  TextStyle(
                          color: Colors.green,
                          fontSize: 60.0, fontWeight: FontWeight.bold, fontFamily: "Comfortaa",)
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontFamily: "comfortaa",
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontFamily: "comfortaa",
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    validator: (val) => val.length < 6 ? 'Enter a password with more than 6 characters please' : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(top: 15.0, left: 20.0),
                    child: InkWell(
                      child: Text("Forgot Password",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontFamily: "comfortaa",
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  GestureDetector(
                    onTap: () async {
                      if(_formKey.currentState.validate()){
                        setState(() => loading = true);
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if(result == null){
                          setState(() {
                            error = 'Could not sign in with those credentials';
                            loading = false;
                          });
                        }else{
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        }
                      }
                    },
                    child: Container(
                      height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                            child: Center(
                              child: Text(
                                  "Log In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "comfortaa",
                                  fontSize: 20,
                                ),
                              ),
                            ),
                        ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2.0,
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 10.0,),
                          Center(
                            child: Text("Log in with Google",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "comfortaa",
                                  fontSize: 20,
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("New?",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "comfortaa",
                  fontSize: 14,
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
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),

                ),
              ),
            ],
          ),
          SizedBox(height: 15.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(error,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "comfortaa",
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
