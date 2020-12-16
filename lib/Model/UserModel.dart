import 'package:cloud_firestore/cloud_firestore.dart';

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
    uid = doc.documentID;
    email = doc.data()['email'];
    accountCreated = doc.data()['accountCreated'];
    name = doc.data()['fullName'];
    groupId = doc.data()['groupId'];
    notifToken = doc.data()['notifToken'];
  }
}
