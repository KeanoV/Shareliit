import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sharekiitstarter/AppFeats/store/add_sale.dart';
import 'package:sharekiitstarter/AppFeats/store/cart_screen.dart';
import 'package:sharekiitstarter/CustomEdits/Container.dart';
import 'package:sharekiitstarter/DatabaseManager/auth.dart';
import 'package:sharekiitstarter/Screens/Homescreen.dart';

import 'package:sharekiitstarter/UserEntry/Login.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sharekiit",
              style: TextStyle(fontSize: 30, color: Colors.amber),
            ),
            Text(
              "DashBoard",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            )
          ],
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ShadowContainer(
          child: ListView(children: <Widget>[
            Center(
              child: ShadowContainer(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  child: _pickedImage == null
                      ? Icon(Icons.add_a_photo_outlined)
                      : null,
                  backgroundImage:
                      _pickedImage != null ? FileImage(_pickedImage) : null,
                ),
              ),
            ),
            const SizedBox(height: 21.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              child: Text(
                "Cart",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => CheckoutCart()));
              },
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              child: Text(
                "Add Product",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => UploadData())),
            ),
            SizedBox(height: 30.0),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                child: Text(
                  "Chat Bot",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HomeScreen()));
                  }
                },
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                child: Text(
                  "Log Out",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {
                  {
                    String _returnString = await Auth().signOut();
                    if (_returnString == "Success") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Login()));
                    }
                  }
                },
              ),
            ),
            SizedBox(height: 20.0),
          ]),
        ),
      ),
    );
  }
}
