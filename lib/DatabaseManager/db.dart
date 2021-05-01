import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sharekiitstarter/Model/groupmodel.dart';

class DBStream {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<GroupModel> getCurrentGroup(String groupId) {
    return _firestore.collection('groups').doc(groupId).snapshots().map(
        (docSnapshot) => GroupModel.fromDocumentSnapshot(doc: docSnapshot));
  }
}
