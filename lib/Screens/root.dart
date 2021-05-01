import 'package:flutter/material.dart';
import 'package:sharekiitstarter/Model/UserModel.dart';
import 'package:sharekiitstarter/Screens/Homescreen.dart';
import 'package:sharekiitstarter/Screens/StartupPage.dart';
import 'package:sharekiitstarter/UserEntry/Login.dart';
import 'package:provider/provider.dart';

enum AuthStatus { unknown, notLoggedIn, loggedIn }

class OurRoot extends StatefulWidget {
  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    UserModel _authStream = Provider.of<UserModel>(context);
    if (_authStream != null) {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    } else {
      setState(() {
        _authStatus = AuthStatus.notLoggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch (_authStatus) {
      case AuthStatus.unknown:
        retVal = Startup();
        break;
      case AuthStatus.notLoggedIn:
        retVal = Login();
        break;
      case AuthStatus.loggedIn:
        retVal = HomeScreen();
        break;
      default:
    }
    return retVal;
  }
}
