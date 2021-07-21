import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_shit/services/auth.dart';
import 'package:flutter_shit/shared/loading.dart';

import '../../StartEveryThing.dart';
import '../signup.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email, password, name, error = '', phoneString;
  int phone, protocol = 0;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              //To keep in track our form
              key: _formKey,
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 25,
                      left: 10,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                        },
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15.0, 80.0, 0.0, 0.0),
                        child:
                        Text(
                            "Signing Up",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 60.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "comfortaa",)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: TextFormField(
                      validator: (value) => value.isEmpty ? 'Enter a name' : null,
                      onChanged: (value) {
                        setState(() => name = value);
                      },
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(
                          fontFamily: "comfortaa",
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    validator: (val) => email.isEmpty ? "Enter a valid email" : null,
                    onChanged: (val) {
                      print("Email wrong");
                      setState(() => email = val);
                    },
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
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    validator: (val) => val.length < 6 ? 'Enter a password with more than 6 characters please' : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
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
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    validator: (val) => (val.length < 10 || val.length > 10) ? 'Enter a real phone number' : null,
                    onChanged: (val) {
                      print("Sapbe");
                      setState(() => phoneString = val);
                      phone = int.parse(phoneString);
                    },
                    decoration: InputDecoration(
                      labelText: "Phone Number (Optional)",
                      labelStyle: TextStyle(
                        fontFamily: "comfortaa",
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  GestureDetector(
                    onTap: () async {
                      //print(protocol);
                      //if(!name.isEmpty || !(name.contains(RegExp(r'[A-Z]'))) || !(name.length < 2) || !email.isEmpty || !password.isEmpty){
                      //  protocol = 1;
                      //}
                      error = " ";
                      protocol = 0;
                      //if(protocol == 0){
                        setState(() {
                          if(name == null || name.length < 2){
                            error += "The name should be larger \n";
                            error += " than two characters. \n";
                            protocol = 1;
                          }
                          if(name == null || name.isEmpty){
                            error = " What's your name? \n";
                            protocol = 1;
                          }
                          if(name == null || (name.contains(RegExp(r'[A-Z]')))){
                            error = " Enter a name using characters. \n";
                            protocol = 1;
                          }
                          if(password == null || password.length <= 6){
                            error += " Please, provide a password \n";
                            error += "  larger than 5 characters. \n";
                            protocol = 1;
                          }
                          });
                      //} else {
                        try {
                          if (_formKey.currentState.validate() && protocol == 0) {
                            //setState(() => loading = true);
                            dynamic result = await _auth.registerWithEmailAndPasswordAndNameAndPhone(email, password, name, phone);
                            if (result == null) {
                              //setState(() => error = 'please provide valid email');
                              //setState(() {loading = false;});
                              setState(() {
                                error += "Invalid Email";
                              });
                            } else {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                            }
                          }
                        } catch (e) {
                          return print(e.toString());
                        }
                      //}
                      //Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()));
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
                            "Sign Up!",
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
            ),
          ],
        ),
      ),
    );
  }
}
