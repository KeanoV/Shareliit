import 'package:flutter/material.dart';
import 'package:sharekiitstarter/AppFeats/ChatApp/groups.dart';

class chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Sale"),
        centerTitle: true,
      ),
      body: creategroup(),
    );
  }
}
