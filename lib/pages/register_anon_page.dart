import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shit/constants.dart';
import 'package:flutter_shit/models/user.dart';
import 'package:flutter_shit/pages/profile_page.dart';
import 'package:flutter_shit/pages/signup.dart';
import 'package:flutter_shit/services/auth.dart';
import 'package:provider/provider.dart';
import '../StartEveryThing.dart';
import 'authenticate/reg.dart';
import 'home_page.dart';
import 'map_page.dart';
import 'my_cart.dart';

class RegisterAnon extends StatefulWidget {
  const RegisterAnon({Key key}) : super(key: key);
  @override
  _RegisterAnonState createState() => _RegisterAnonState();
}

final FirebaseAuth _aloha = FirebaseAuth.instance;

class _RegisterAnonState extends State<RegisterAnon> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String email, password, name, error = '', phoneString;
  int phone, protocol = 0;


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    List<Widget> pagelist = <Widget> [
      HomePage(),
      MapPage(),
      Cart(),
      ProfilePage(),
    ];

    return Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    bottomOpacity: 0.0,
                    elevation: 0.0,
                    backgroundColor: Colors.green,
                    centerTitle: true,
                    title: Text("Profile"),
                    actions: <Widget>[
                      //Para editar perfil
                      FlatButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                      },
                        child: Text("Edit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                info(
                  name: "Create your account neighbor",
                  email: "Sign Up!",
                  image: "assets/images/Fork_Knife.png",
                ),
                SizedBox(height: 20,),
                Center(
                    //scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Form(
                          //To keep in track our form
                          key: _formKey,
                            child: Container(
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
                                    validator: (val) => val.length < 4 ? 'Enter a real phone number' : null,
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
                                            /*
                                            WidgetsBinding.instance.addPostFrameCallback((_) {
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                                            });
                                             */

                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));

                                            //Navigator.push(context, MaterialPageRoute(
                                            //    builder: (context) => HomeScreen()));
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

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key key, this.title, this.press, this.Indexicon,
  }) : super(key: key);
  final String title;
  final Function press;
  final int Indexicon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
          children: <Widget>[
            Icon(IconData(Indexicon, fontFamily: 'MaterialIcons')),
            SizedBox(width: 20,),
            Text(title, style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 16,),
          ],
        ),
      ),
    );
  }
}

class info extends StatelessWidget {
  const info({
    Key key, this.name, this.email, this.image,
  }) : super(key: key);

  final String name, email, image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 150,
              color: Colors.green,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 40),
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 8),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(image)),
                  ),
                ),
                Text(name, style: TextStyle(
                  fontSize: 22,
                  color: kTextColor,
                ),
                ),
                SizedBox(height: 5 ,),
                Text(email,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8492A2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//String userEmail;


class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width/2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}