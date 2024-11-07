import 'package:flutter/material.dart';

class AppTextStyles {
  static TextTheme textTheme = const TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        letterSpacing: -1,
        color: Color.fromRGBO(68, 68, 69, 1),
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        color: Color.fromRGBO(68, 68, 69, 1),
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        letterSpacing: -1,
        color: Colors.white,
      ));
}
