import 'package:flutter/material.dart';

ThemeData softTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff6ea0b8),
    ),
    scaffoldBackgroundColor: const Color(0xfffff8ff),
    backgroundColor: const Color(0xfffff8ff),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xff6ea0b8),
    ),
    cardColor: const Color(0xfff0f8ff),
    fontFamily: 'Madeleina',
  );
}
