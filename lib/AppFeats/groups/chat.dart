import 'package:flutter/material.dart';
import 'package:sharekiitstarter/AppFeats/groups/groups.dart';

class chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text("Create Book Groups",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.purple)),
      ),
      body: Container(child: creategroup()),
    );
  }
}
