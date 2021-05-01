import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sharekiitstarter/DatabaseManager/auth.dart';
import 'package:sharekiitstarter/Model/UserModel.dart';

import 'package:provider/provider.dart';
import 'package:sharekiitstarter/pathdoc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
        value: Auth().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Docpicker(),
        ));
  }
}
