import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sharekiitstarter/Model/UserModel.dart';
import 'package:sharekiitstarter/Model/groupmodel.dart';

class DBStream {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<UserModel> getCurrentUser(String uid) {
    return _firestore
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(doc: docSnapshot));
  }

  Stream<GroupModel> getCurrentGroup(String groupId) {
    return _firestore.collection('groups').doc(groupId).snapshots().map(
        (docSnapshot) => GroupModel.fromDocumentSnapshot(doc: docSnapshot));
  }
}
