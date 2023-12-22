import 'package:flutter/material.dart';

class CustomTheme {
  ThemeData customTheme() {
    return ThemeData.light().copyWith(
      primaryColor: Colors.deepOrange,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Colors.deepOrange,
      ),
    );
  }
}
