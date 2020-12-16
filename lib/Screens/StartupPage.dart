import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharekiitstarter/CustomEdits/bezierContainer.dart';
import 'package:sharekiitstarter/UserEntry/Login.dart';
import 'package:sharekiitstarter/UserEntry/SignUp.dart';

class Startup extends StatefulWidget {
  @override
  _StartupState createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: height,
                child: Stack(children: <Widget>[
                  Column(
                    children: [
                      Container(
                        child: _title(),
                        padding: EdgeInsets.symmetric(vertical: 180),
                        margin: EdgeInsets.symmetric(vertical: 130),
                      ),
                    ],
                  ),
                  Positioned(
                    top: -MediaQuery.of(context).size.height * .9,
                    right: -MediaQuery.of(context).size.width * .10,
                    bottom: -MediaQuery.of(context).size.width * .35,
                    child: BezierContainer(),
                  ),
                  Row(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () => _pushPage(context, Login()),
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFFBA68C8),
                                Color(0xFFCE93D8),
                                Color(0xFFE1BEE7),
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(15),
                          child: const Text('Login',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        child: RaisedButton(
                          onPressed: () => _pushPage(context, OurSignUp()),
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFFBA68C8),
                                  Color(0xFFCE93D8),
                                  Color(0xFFE1BEE7),
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.all(15.0),
                            child: const Text('Register',
                                style: TextStyle(fontSize: 20)),
                          ),
                        ),
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      )
                    ],
                  ),
                ]))
          ]),
    ));
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Sh',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 35,
            fontWeight: FontWeight.w700,
            color: Color(0XFFCE93D8),
          ),
          children: [
            TextSpan(
              text: 'are',
              style: TextStyle(color: Colors.black, fontSize: 35),
            ),
            TextSpan(
              text: 'Kiit',
              style: TextStyle(color: Color(0XFFCE93D8), fontSize: 30),
            ),
          ]),
    );
  }
}
