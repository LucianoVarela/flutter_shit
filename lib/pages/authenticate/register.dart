import 'package:flutter/material.dart';
import 'package:flutter_shit/services/auth.dart';
import 'package:flutter_shit/services/auth.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();

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
        title: Text('Signing Up to Market Town'),
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
                  'Signing Up',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
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