import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sharekiitstarter/Model/UserModel.dart';
import 'package:sharekiitstarter/Model/bookModel.dart';

class DatabaseManager {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> createUser(UserModel userModel) async {
    String retval = "error";
    try {
      await _firestore.collection("users").doc(userModel.uid).set({
        'name': userModel.name,
        'email': userModel.email,
        'accountCreated': Timestamp.now(),
      });
    } catch (e) {
      print(e);
    }
    return retval;
  }

  Future<UserModel> getUserInfo(String uid) async {
    UserModel retVal = UserModel();
    try {
      DocumentSnapshot _docSnapshot =
          await _firestore.collection("users").doc(uid).get();
      retVal.uid = uid;
      retVal.name = _docSnapshot.data()["name"];
      retVal.email = _docSnapshot.data()["email"];
      retVal.accountCreated = _docSnapshot.data()["accountCreated"];
    } catch (e) {
      print(e);
    }
  }
}
