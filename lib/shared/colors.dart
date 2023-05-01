import 'package:flutter/material.dart';

enum EditorColor {
  background._(
    dark: Color(0xFF2B2B2B),
    light: Colors.white,
  ),
  plain._(
    dark: Color(0xFFa9b7c6),
    light: Colors.black,
  ),
  keyword._(
    dark: Color(0xFFcc7832),
    light: Color(0xFF000080),
  ),
  clazz._(
    dark: Color(0xFFffc66d),
    light: Color(0xFF2196f3),
  ),
  number._(
    dark: Color(0xFF6897bb),
    light: Color(0xFF2196f3),
  ),
  value._(
    dark: Color(0xFF9876aa),
    light: Color(0xFF660e7a),
  ),
  text._(
    dark: Color(0xFF6a8759),
    light: Color(0xFF008000),
  ),
  brackets._(
    dark: Color(0xFFe6b422),
    light: Color(0xFF004d40),
  ),
  at._(
    dark: Color(0xFFbbb529),
    light: Color(0xFF808000),
  );

  const EditorColor._({required this.dark, required this.light});

  final Color dark;
  final Color light;

  Color? lerp(double t) => Color.lerp(dark, light, t);
}
