import 'package:flutter/material.dart';
import 'package:sharekiitstarter/CustomEdits/Container.dart';
import 'package:sharekiitstarter/CustomEdits/bezierContainer.dart';
import 'package:sharekiitstarter/UserEntry/Login.dart';
import 'package:sharekiitstarter/UserEntry/signupform.dart';

class OurSignUp extends StatefulWidget {
  @override
  _OurSignUpState createState() => _OurSignUpState();
}

class _OurSignUpState extends State<OurSignUp> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white10,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()))),
        ),
        backgroundColor: Colors.white,
        body:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Expanded(
            child: Container(
              child: ListView(padding: EdgeInsets.all(0.0), children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(
                  height: 50.0,
                ),
                ShadowContainer(
                  child: OurSignUpForm(),
                ),
                Container(
                  height: height,
                  child: Stack(children: <Widget>[
                    Positioned(
                      top: -MediaQuery.of(context).size.height * .0,
                      right: -MediaQuery.of(context).size.width * .2,
                      child: BezierContainer(),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[],
                    ),
                  ]),
                )
              ]),
            ),
          )
        ]));
  }
}
