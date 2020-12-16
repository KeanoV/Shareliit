import 'package:flutter/material.dart';
import 'package:sharekiitstarter/CustomEdits/Container.dart';
import 'package:image_picker/image_picker.dart';

class sales extends StatefulWidget {
  @override
  _salesState createState() => _salesState();
}

class _salesState extends State<sales> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _pricecontroller = TextEditingController();

  TextEditingController _authorcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            actions: [
              FlatButton(
                onPressed: () {},
                child: Text("Upload Image",
                    style: TextStyle(fontSize: 10, color: Colors.deepPurple)),
              )
            ],
            backgroundColor: Colors.white,
            title: Text("On Sale",
                style: TextStyle(fontSize: 25, color: Colors.purple)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: ShadowContainer(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: TextFormField(
                          autofocus: true,
                          controller: _namecontroller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.book_online_outlined),
                            hintText: "Book Name",
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: TextFormField(
                          autofocus: true,
                          controller: _authorcontroller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "Author",
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: TextFormField(
                          autofocus: true,
                          controller: _pricecontroller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.money),
                            hintText: "Price",
                          )),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  chooseImage() async {
    var pickedImage = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1200,
        imageQuality: 80);
  }
}
