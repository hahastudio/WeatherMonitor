import 'package:flutter/material.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white
      ),
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      dividerColor: Colors.black87,
      errorColor: Colors.red,
      brightness: Brightness.light,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
        ),
        bodyText2: TextStyle(
          color: Colors.black45,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
          .copyWith(brightness: Brightness.light, secondary: Colors.blue),
    ),
    AppTheme.darkTheme: ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white
      ),
      scaffoldBackgroundColor: Colors.black,
      backgroundColor: Colors.black,
      dividerColor: Colors.white70,
      errorColor: Colors.red,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
        ),
        bodyText2: TextStyle(
          color: Colors.white60,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey)
          .copyWith(brightness: Brightness.dark, secondary: Colors.blueGrey),
    )
  };

  static ThemeMode convert(AppTheme appTheme) {
    switch (appTheme) {
      case AppTheme.lightTheme:
        return ThemeMode.light;
      case AppTheme.darkTheme:
        return ThemeMode.dark;
      case AppTheme.systemTheme:
      default:
        return ThemeMode.system;
    }
  }
}

enum AppTheme {
  systemTheme,
  lightTheme,
  darkTheme
}