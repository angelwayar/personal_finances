import 'package:flutter/material.dart';
import 'package:personal_finances/core/theme/button_theme.dart';
import 'package:personal_finances/core/theme/input_theme.dart';

import 'color_schemes.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    // primaryColor: Colors.deepPurple,
    colorScheme: lightColorScheme,
    inputDecorationTheme: InputThemeApp.lightInputDecorationTheme,
    elevatedButtonTheme: ElevatedButtonCustomTheme.lightElevatedButtonTheme,
  );
}



/*
paleta de colores
https://colorhunt.co/palette/f1f3f8d6e0f08d93ab393b44

flutter build theme
https://m3.material.io/theme-builder#/custom

colors
https://colorhunt.co/palettes/

flutter-pub
https://pub.dev/packages/material_color_utilities
*/