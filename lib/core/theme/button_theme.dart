import 'package:flutter/material.dart';

class ElevatedButtonCustomTheme {
  ElevatedButtonCustomTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      minimumSize: const Size(420.0, 60.0),
    ),
  );
}
