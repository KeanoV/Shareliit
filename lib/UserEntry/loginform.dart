import 'package:flutter/material.dart';
import 'package:sharekiitstarter/CustomEdits/Container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharekiitstarter/Screens/CurrentUser.dart';
import 'package:sharekiitstarter/Screens/Homescreen.dart';
import 'package:sharekiitstarter/UserEntry/SignUp.dart';

enum LoginType {
  email,
  google,
}

class Loginform extends StatefulWidget {
  @override
  _LoginformState createState() => _LoginformState();
}

void _loginUser({
  @required LoginType type,
  String email,
  String password,
  BuildContext context,
}) async {
  try {
    String _returnString;

    switch (type) {
      case LoginType.email:
        _returnString = await Auth().loginUserWithEmail(email, password);
        break;
      case LoginType.google:
        _returnString = await Auth().loginUserWithGoogle();
        break;
      default:
    }

    if (_returnString == "success") {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("Login Failed"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  } catch (e) {
    print(e);
  }
}

Widget _googleButton() {
  return OutlineButton(
    splashColor: Colors.grey,
    onPressed: () {
      _loginUser(type: LoginType.google);
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    highlightElevation: 0,
    borderSide: BorderSide(color: Colors.grey),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage("assets/goologo.jpg"), height: 25.0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Sign in with Google',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class _LoginformState extends State<Loginform> {
  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 8.0,
              ),
              child: Container(
                child: RichText(
                  textAlign: TextAlign.center,
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
                          style: TextStyle(color: Colors.black, fontSize: 35),
                        ),
                        TextSpan(
                          text: 'Kitt',
                          style:
                              TextStyle(color: Color(0xFFB39DDB), fontSize: 30),
                        ),
                      ]),
                ),
              ),
            ),
            TextFormField(
                autofocus: true,
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
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
                  child: Text(
                    'Login Now',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                _loginUser(
                    type: LoginType.email,
                    email: _emailController.text,
                    password: _passwordController.text,
                    context: context);
              },
            ),
            FlatButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OurSignUp(),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account ?",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                          color: Color(0xFF7E57C2),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            _googleButton()
          ],
        ),
      ),
    );
  }
}
