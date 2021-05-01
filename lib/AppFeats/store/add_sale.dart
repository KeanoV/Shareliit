import 'dart:collection';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sharekiitstarter/CustomEdits/Container.dart';

class UploadData extends StatefulWidget {
  @override
  _UploadDataState createState() => _UploadDataState();
}

class _UploadDataState extends State<UploadData> {
  File imageFile;
  var formKey = GlobalKey<FormState>();
  String name, author, price, description, gradelevel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Sharekiit",
                style: TextStyle(fontSize: 30, color: Colors.amber),
              ),
              Text(
                "Sales",
                style: TextStyle(fontSize: 22, color: Colors.blue),
              )
            ],
          ),
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: ShadowContainer(
            child: Form(
              key: formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 38)),
                    ShadowContainer(
                      child: Container(
                        padding: EdgeInsets.all(40),
                        child: imageFile == null
                            ? FlatButton(
                                onPressed: () {
                                  _showDialog();
                                },
                                child: Icon(
                                  Icons.add_a_photo,
                                  size: 50,
                                  color: Color(0xFF000000),
                                ))
                            : Image.file(
                                imageFile,
                                width: 200,
                                height: 100,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please write the name of production";
                              } else {
                                name = value;
                              }
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Color(0xFF000000), width: 1)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Color(0xFF000000), width: 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Color(0xFF000000), width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Color(0xFF000000), width: 1))),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please write the material of production";
                              } else {
                                author = value;
                              }
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Author",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Color(0xFF000000), width: 1)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Color(0xFF000000), width: 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Color(0xFF000000), width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Color(0xFF000000), width: 1))),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please write the price of production";
                              } else {
                                price = value;
                              }
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Price",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Color(0xFF000000), width: 1)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Color(0xFF000000), width: 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Color(0xFF000000), width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Color(0xFF000000), width: 1))),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: () {
                        if (imageFile == null) {
                          Fluttertoast.showToast(
                              msg: "Please select an image",
                              gravity: ToastGravity.CENTER,
                              toastLength: Toast.LENGTH_LONG,
                              timeInSecForIosWeb: 2);
                        } else {
                          upload();
                        }
                      },
                      child: Container(
                        child: Text(
                          "Upload",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              backgroundColor: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Future<void> _showDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            title: Text("You want take a photo from ?"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallary"),
                    onTap: () {
                      openGallary();
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 8)),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      openCamera();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> openGallary() async {
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      imageFile = File(pickedFile.path);
    });
  }

  Future<void> openCamera() async {
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = File(pickedFile.path);
    });
  }

  Future<void> upload() async {
    if (formKey.currentState.validate()) {
      Reference reference = FirebaseStorage.instance
          .ref()
          .child("images")
          .child(new DateTime.now().millisecondsSinceEpoch.toString() +
              "." +
              imageFile.path);
      UploadTask uploadTask = reference.putFile(imageFile);

      var imageUrl = await (await uploadTask.whenComplete(() => null))
          .ref
          .getDownloadURL();
      String url = imageUrl.toString();
      DatabaseReference databaseReference =
          FirebaseDatabase.instance.reference().child("Books");
      String uploadId = databaseReference.push().key;
      HashMap map = new HashMap();
      map["name"] = name;
      map["author"] = author;
      map["price"] = price;
      map["imgUrl"] = url;
      map["description"] = description;
      map["gradelevel"] = gradelevel;

      databaseReference.child(uploadId).set(map);
    }
  }
}
