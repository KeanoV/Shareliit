import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String name;
  String uid;
  String email;
  String groupId;
  String password;
  Timestamp accountCreated;
  String notifToken;

  UserModel({
    this.name,
    this.uid,
    this.email,
    this.groupId,
    this.password,
    this.accountCreated,
    this.notifToken,
  });

  UserModel.fromDocumentSnapshot({DocumentSnapshot doc}) {
    uid = doc.id;
    email = doc.data()['email'];
    accountCreated = doc.data()['accountCreated'];
    name = doc.data()['fullName'];
    groupId = doc.data()['groupId'];
    notifToken = doc.data()['notifToken'];
  }
  UserModel.fromFirebaseUser({User user}) {
    uid = user.uid;
    email = user.email;
  }
}
