import 'package:flutter/material.dart';
import 'package:flutter_shit/services/auth.dart';
import '../../StartEveryThing.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  // Text Field State
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(

        //Para que la flecha no aparezca en el top
        automaticallyImplyLeading: false,
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Market Town'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                  onChanged: (val) {
                    setState(() => email = val);
                  }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  }
              ),
              SizedBox(width: 10.0,),
              RaisedButton(
                color: Colors.red[400],
                child: Text(
                  'Sign in',
                    style: TextStyle(color: Colors.white),
                ),
                onPressed: () async{
                  print(email);
                  print(password);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
