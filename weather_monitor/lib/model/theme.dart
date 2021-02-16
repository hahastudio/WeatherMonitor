import 'package:flutter/material.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.blue,
      backgroundColor: Colors.white,
      accentColor: Colors.blue,
      dividerColor: Colors.black87,
      errorColor: Colors.red,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
        ),
        bodyText2: TextStyle(
          color: Colors.black45,
        ),
      ),
    ),
    AppTheme.darkTheme: ThemeData(
      scaffoldBackgroundColor: Colors.black,
      primarySwatch: Colors.blueGrey,
      backgroundColor: Colors.black,
      accentColor: Colors.blueGrey,
      dividerColor: Colors.white70,
      errorColor: Colors.red,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
        ),
        bodyText2: TextStyle(
          color: Colors.white60,
        ),
      ),
    )
  };
}

enum AppTheme {
  lightTheme,
  darkTheme,
}