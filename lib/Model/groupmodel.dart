import 'package:cloud_firestore/cloud_firestore.dart';

class GroupModel {
  String id;
  String name;
  List<String> tokens;
  String currentBookId;
  int indexPickingBook;
  double price;

  GroupModel({
    this.id,
    this.name,
    this.tokens,
    this.currentBookId,
    this.indexPickingBook,
    this.price,
  });

  GroupModel.fromDocumentSnapshot({DocumentSnapshot doc}) {
    id = doc.documentID;
    name = doc.data()["name"];
    tokens = List<String>.from(doc.data()["tokens"] ?? []);
    currentBookId = doc.data()["currentBookId"];
    indexPickingBook = doc.data()["indexPickingBook"];
    price = doc.data()["price"];
  }
}
