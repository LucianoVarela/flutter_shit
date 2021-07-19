import 'package:flutter/material.dart';
import 'package:flutter_shit/models/market.dart';
import 'package:flutter_shit/models/user.dart';
import 'package:flutter_shit/services/database.dart';
import 'package:flutter_shit/shared/loading.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'package:flutter_shit/services/database.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> address = ['0', '1', '2', '3', '4'];
  //final market = Provider.of<List<Market>>(SettingsForm());

  // form values
  String _currentAddress;
  String _currentMarket;
  int _currentStars;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      //snapshot refresh the builder nothing to do with data
      builder: (context, snapshot) {
        if(snapshot.hasData){

          UserData userData = snapshot.data;

          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Update your rating of stars',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  //current value from data base placed on initial value
                  initialValue: userData.name,
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Please enter market' : null,
                  onChanged: (val) => setState(() => _currentMarket = val),
                ),
                SizedBox(height: 20.0),
                // dropdown
                DropdownButtonFormField(
                  decoration: textInputDecoration,
                  // value itself
                  //userData is called and then we can compare to the current value
                  value: _currentAddress ?? userData.address,
                  items: address.map((address){
                    return DropdownMenuItem(
                      //value of what they select
                      value: address,
                      child: Text('$address Market Address'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentAddress = val),
                ),
                // slider
                Slider(
                  value: (_currentStars ?? userData.phone).toDouble(),
                  activeColor: Colors.green[_currentStars ?? userData.phone],
                  inactiveColor: Colors.green[_currentStars ?? userData.phone],
                  min: 100.0,
                  max: 900.0,
                  divisions: 8,
                  onChanged: (val) => setState(() => _currentStars = val.round()),
                ),
                RaisedButton(
                  color: Colors.green[400],
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      await DatabaseService(uid: user.uid).updateUserData(
                          _currentMarket ?? userData.name,
                          _currentAddress ?? userData.address,
                          _currentStars ?? userData.phone
                      );
                      //to return dynamicly the new values
                      Navigator.pop(context);
                    }
                    //updateUserData(_currentMarket, _currentAddress, _currentStars);
                    print(_currentMarket);
                    print(_currentAddress);
                    print(_currentStars);
                  },
                ),
              ],
            ),
          );
        } else {
          return Loading();
        }

      }
    );
  }
}
