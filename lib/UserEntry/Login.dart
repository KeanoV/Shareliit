import 'package:flutter/material.dart';
import 'package:sharekiitstarter/UserEntry/loginform.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Expanded(
            child: Container(
              child: ListView(padding: EdgeInsets.all(15.0), children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Image.asset("assets/label.png"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Loginform(),
              ]),
            ),
          )
        ]));
  }
}
