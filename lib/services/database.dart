import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shit/models/market.dart';
import 'package:flutter_shit/models/user.dart';

class DatabaseService {

  //Uid stored
  final String uid;
  DatabaseService({this.uid});

  // collection reference - Firestore creates it if it's not created yet
  // Add or remove items to the collection - marketCollection
  final CollectionReference userCollection = Firestore.instance.collection('userData');

  //Update user data to the database
  Future updateUserData(String name, String address, int phone) async {
    //to pass the data on the correct collection
    return await userCollection.document(uid).setData({
      'name' : name,
      'address' : address,
      'phone' : phone,
    });
  }

  //market list from snapshot
  List<Market> _userListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Market(
        name: doc.data['name'] ?? '',
        address: doc.data['address'] ?? '',
        phone: doc.data['phone'] ?? 0,
      );
    }).toList();
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      address: snapshot.data['address'],
      phone: snapshot.data['phone'],
    );
  }

  // get shops stream, QuerySnapshot gives data when something changes
Stream<List<Market>> get shops {
    return userCollection.snapshots().map(_userListFromSnapshot);
}

  // get user documentation stream
Stream<UserData> get userData{
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
}
}