import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  Future<void> addData(appData) async {
    FirebaseFirestore.instance.collection("Sales").add(appData).catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await FirebaseFirestore.instance.collection("Sales").snapshots();
  }
}
