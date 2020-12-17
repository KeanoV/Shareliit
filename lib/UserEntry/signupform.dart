import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharekiitstarter/Screens/CurrentUser.dart';
import 'package:sharekiitstarter/Screens/Homescreen.dart';

class OurSignUpForm extends StatefulWidget {
  @override
  _OurSignUpFormState createState() => _OurSignUpFormState();
}

final TextEditingController _displayName = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _confirmpasswordController =
    TextEditingController();

void _signUpUser(
    String email, String password, BuildContext context, String name) async {
  try {
    String _returnString = await Auth().signUpUser(email, password, name);
    if (_returnString == "success") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
        (route) => false,
      );
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(_returnString),
          duration: Duration(seconds: 2),
        ),
      );
    }
  } catch (e) {
    print(e);
  }
}

class _OurSignUpFormState extends State<OurSignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'Sh',
                          style: GoogleFonts.portLligatSans(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF7E57C2),
                          ),
                          children: [
                            TextSpan(
                              text: 'are',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 35),
                            ),
                            TextSpan(
                              text: 'Kitt',
                              style: TextStyle(
                                  color: Color(0xFFB39DDB), fontSize: 30),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 50.0,
                        horizontal: 0.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Text("Sign Up",
                          style: GoogleFonts.portLligatSans(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                            color: Color(0XFFCE93D8),
                          )),
                    )
                  ],
                ),
                TextFormField(
                    autofocus: true,
                    controller: _displayName,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Name",
                    )),
                SizedBox(height: 20.0),
                TextFormField(
                    autofocus: true,
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail_outline_outlined),
                      hintText: "Email",
                    )),
                SizedBox(height: 20.0),
                TextFormField(
                    obscureText: true,
                    autofocus: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_open_outlined),
                      hintText: "Password",
                    )),
                SizedBox(height: 20.0),
                TextFormField(
                    obscureText: true,
                    autofocus: true,
                    controller: _confirmpasswordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_open_outlined),
                      hintText: "Confirm Password",
                    )),
                SizedBox(height: 20.0),
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(2, 4),
                                blurRadius: 5,
                                spreadRadius: 2)
                          ],
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFF311b92), Color(0xFF4527A0)])),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Sign Up Now',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    if (_passwordController.text ==
                        _confirmpasswordController.text) {
                      _signUpUser(
                        _emailController.text,
                        _passwordController.text,
                        context,
                        _displayName.text,
                      );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                        (route) => false,
                      );
                    } else {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Failed to Sign Up. '),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(
                  width: 30,
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
