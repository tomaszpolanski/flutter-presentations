import 'package:flutter/material.dart';

class EditorColor {
  const EditorColor._({@required this.dark, @required this.light});

  static const background = EditorColor._(
    dark: Color(0xFF2B2B2B),
    light: Colors.white,
  );
  static const plain = EditorColor._(
    dark: Color(0xFFa9b7c6),
    light: Colors.black,
  );
  static const keyword = EditorColor._(
    dark: Color(0xFFcc7832),
    light: Color(0xFF000080),
  );
  static const clazz = EditorColor._(
    dark: Color(0xFFffc66d),
    light: Color(0xFF2196f3),
  );
  static const number = EditorColor._(
    dark: Color(0xFF6897bb),
    light: Color(0xFF2196f3),
  );
  static const value = EditorColor._(
    dark: Color(0xFF9876aa),
    light: Color(0xFF660e7a),
  );
  static const text = EditorColor._(
    dark: Color(0xFF6a8759),
    light: Color(0xFF008000),
  );
  static const brackets = EditorColor._(
    dark: Color(0xFFe6b422),
    light: Color(0xFF004d40),
  );
  static const at = EditorColor._(
    dark: Color(0xFFbbb529),
    light: Color(0xFF808000),
  );

  final Color dark;
  final Color light;

  Color lerp(double t) => Color.lerp(dark, light, t);
}
