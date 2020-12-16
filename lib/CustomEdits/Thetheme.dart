import 'package:flutter/material.dart';

class Thetheme {
  Color _pinks = Color.alphaBlend(
    Color(0xFFFF559F),
    Color(0xFFCF5CCF),
  );
  ThemeData buildtheme() {
    return ThemeData(
      canvasColor: _pinks,
    );
  }
}
