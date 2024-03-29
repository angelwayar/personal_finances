import 'package:flutter/material.dart';
import 'package:personal_finances/core/theme/button_theme.dart';
import 'package:personal_finances/core/theme/input_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple,
    inputDecorationTheme: InputThemeApp.lightInputDecorationTheme,
    elevatedButtonTheme: ElevatedButtonCustomTheme.lightElevatedButtonTheme,
  );
}
