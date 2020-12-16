import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sharekiitstarter/AppFeats/ChatApp/groups.dart';
import 'package:sharekiitstarter/AppFeats/book/Sales.dart';
import 'package:sharekiitstarter/CustomEdits/Container.dart';
import 'package:sharekiitstarter/Screens/CurrentUser.dart';
import 'package:sharekiitstarter/Screens/root.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _pickedImage;
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "DashBoard",
          style: TextStyle(fontSize: 20, color: Color(0xFF311b92)),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ShadowContainer(
          child: ListView(
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.purple[50],
                  radius: 80,
                  child: _pickedImage == null ? Text("Picture") : null,
                  backgroundImage:
                      _pickedImage != null ? FileImage(_pickedImage) : null,
                ),
              ),
              const SizedBox(height: 10.0),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Text(
                  "Pick a Image",
                  style: TextStyle(color: Colors.purple),
                ),
                onPressed: () {
                  _showPickOptionsDialog(context);
                },
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Text(
                  "Sell",
                  style: TextStyle(color: Colors.purple),
                ),
                onPressed: () => _pushPage(context, creategroup()),
              ),
              Container(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Text(
                    "Log Out",
                    style: TextStyle(color: Colors.purple),
                  ),
                  onPressed: () async {
                    {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OurRoot(),
                          ),
                          (route) => false);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _loadPicker(ImageSource source) async {
    File picked = await ImagePicker.pickImage(source: source);
    if (picked != null) {}
    Navigator.pop(context);
  }

  void _showPickOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text("Pick from Gallery"),
              onTap: () {
                _loadPicker(ImageSource.gallery);
              },
            ),
            ListTile(
              title: Text("Take a pictuer"),
              onTap: () {
                _loadPicker(ImageSource.camera);
              },
            )
          ],
        ),
      ),
    );
  }
}
