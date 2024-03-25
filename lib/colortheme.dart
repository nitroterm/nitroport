import 'package:flutter/material.dart';

ColorScheme nitrotermColorScheme() {
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

ButtonStyle primaryButtonStyle() {
  return ButtonStyle(
    backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xFFf9e900)),
    foregroundColor: const MaterialStatePropertyAll<Color>(Colors.black),
    overlayColor: const MaterialStatePropertyAll<Color>(Colors.white)
  );
}

ButtonStyle secondaryButtonStyle() {
  return ButtonStyle(
      backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xFF290D59)),
      foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
      overlayColor: const MaterialStatePropertyAll<Color>(Color(0xFF8759D7))
  );
}