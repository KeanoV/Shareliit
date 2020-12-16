import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sharekiitstarter/Screens/CurrentUser.dart';
import 'package:sharekiitstarter/UserEntry/Login.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CurrentUser(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Login(),
        ));
  }
}
