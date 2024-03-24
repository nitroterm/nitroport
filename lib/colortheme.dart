import 'package:flutter/material.dart';

ColorScheme getApplicationColorScheme() {
  return const ColorScheme(brightness: Brightness.dark,
      primary: Color(0xFFf9e900),
      onPrimary: Color(0xFF080016),
      secondary: Color(0xFF290D59),
      onSecondary: Colors.white,
      error: Color(0xFFFF5D70),
      onError: Colors.white,
      background: Color(0xFF080016),
      onBackground: Colors.white,
      surface: Color(0xFF0E0025),
      onSurface: Colors.white);
}
