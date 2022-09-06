import 'package:flutter/material.dart';
import '../extensions/theme_extension.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: const Color(0xFF1E88E5),
  extensions: const <ThemeExtension<dynamic>>[
    MyCustomTheme(
      brandColor: Color(0xFF1E88E5),
      dangerColor: Color(0xFFE53935),
      h1Text: TextStyle(color: Colors.deepOrange),
    ),
  ],
);
