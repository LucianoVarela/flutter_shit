import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_shit/constants.dart';
import 'package:flutter_shit/pages/Favourite.dart';
import 'package:flutter_shit/pages/my_wallet.dart';
import 'package:flutter_shit/pages/signup.dart';
import 'package:flutter_shit/pages/help.dart';
import '/services/auth.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
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
          FlatButton(onPressed: () {},
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
      body: Column(
        children: <Widget>[
          info(
            name: "Peluca",
            email: "peluca@Sape.com",
            image: "assets/images/Fork_Knife.png",
          ),
          SizedBox(height: 20,),
          ProfileMenuItem(
            title: "My wallet",
            Indexicon: 60979,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyWallet()));
            },
          ),
          ProfileMenuItem(
            title: "Favorite",
            Indexicon: 57947,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Favourite()));
            },
          ),
          ProfileMenuItem(
            title: "Help",
            Indexicon: 58123,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => help()));
            },
          ),
          ProfileMenuItem(
            title: "Log Out",
            Indexicon: 58519,
            press: () async{
              await _auth.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
          ),
        ],
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