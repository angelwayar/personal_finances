import 'package:flutter/material.dart';

class InputThemeApp {
  InputThemeApp._();

  static final lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    errorStyle: const TextStyle(color: Color(0XFFF44336)),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Colors.deepPurple,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 1.0,
        color: Color(0XFFF44336),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 1.0,
        color: Color(0XFFF44336),
      ),
    ),
  );
}
