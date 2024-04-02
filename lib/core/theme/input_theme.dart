import 'package:flutter/material.dart';

import 'color_schemes.dart';

class InputThemeApp {
  InputThemeApp._();

  static final lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: lightColorScheme.onPrimary,
    // errorStyle: const TextStyle(color: Color(0XFFF44336)),
    enabledBorder: OutlineInputBorder(
      // borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: lightColorScheme.primary,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 1.0,
        // color: Color(0XFFF44336),
      ),
    ),
    disabledBorder: OutlineInputBorder(
      // borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 1.0,
        // color: Color(0XFFF44336),
      ),
    ),
  );
}
