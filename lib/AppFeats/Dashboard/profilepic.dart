import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sharekiitstarter/AppFeats/groups/model/bookForm.dart';
import 'package:sharekiitstarter/CustomEdits/Container.dart';
import 'package:sharekiitstarter/DatabaseManager/auth.dart';
import 'package:sharekiitstarter/Screens/root.dart';
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
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "DashBoard",
          style: TextStyle(fontSize: 20, color: Color(0xFF311b92)),
        ),
        elevation: 0.0,
        backgroundColor: Colors.purple[50],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ShadowContainer(
          child: ListView(children: <Widget>[
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
              padding: EdgeInsets.all(30.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Text(
                "Pick a Image",
                style: TextStyle(color: Colors.purple, fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Createsale()));
              },
            ),
            SizedBox(height: 30.0),
            RaisedButton(
              padding: EdgeInsets.all(30.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Text(
                "Sell",
                style: TextStyle(color: Colors.purple, fontSize: 20),
              ),
              onPressed: () => _pushPage(context, Createsale()),
            ),
            SizedBox(height: 30.0),
            Container(
              child: RaisedButton(
                padding: EdgeInsets.all(30.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Text(
                  "Log Out",
                  style: TextStyle(color: Colors.purple, fontSize: 20),
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
