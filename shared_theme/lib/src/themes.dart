import 'package:flutter/material.dart';
import 'package:shared_theme/src/groupon_theme.dart';

ThemeData blueLight() {
  final t = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: GTheme.flutter3,
    colorScheme: ThemeData.light().colorScheme.copyWith(
          background: Colors.black,
          onBackground: Colors.white,
        ),
    textTheme: TextTheme(
      headlineSmall: GTheme.big.copyWith(color: GTheme.flutter3, fontSize: 40),
      titleLarge: GTheme.big.copyWith(color: GTheme.flutter2, fontSize: 80),
      bodyMedium: GTheme.big.copyWith(color: GTheme.flutter2),
      bodySmall: GTheme.smaller.copyWith(color: GTheme.flutter1),
    ),
  );
  return t.copyWith(
    colorScheme: t.colorScheme.copyWith(
      background: Colors.white,
      onBackground: Colors.black,
      primaryContainer: GTheme.flutter2,
      onPrimaryContainer: Colors.white,
    ),
  );
}

ThemeData blueDark() {
  final t = ThemeData.dark().copyWith(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.black12,
    colorScheme: ThemeData.light().colorScheme.copyWith(
          background: Colors.black12,
          onBackground: Colors.white,
        ),
    appBarTheme: const AppBarTheme(
      color: Colors.black12,
    ),
    textTheme: TextTheme(
      headlineSmall: GTheme.big.copyWith(color: GTheme.flutter3, fontSize: 140),
      titleLarge: GTheme.big.copyWith(color: GTheme.flutter3, fontSize: 80),
      bodyMedium: GTheme.big.copyWith(color: GTheme.flutter2),
      bodySmall: GTheme.smaller.copyWith(color: GTheme.flutter3),
    ),
  );
  return t.copyWith(
    colorScheme: t.colorScheme.copyWith(
      background: Colors.black12,
      onBackground: Colors.white,
      primaryContainer: GTheme.flutter3,
      onPrimaryContainer: Colors.white,
    ),
  );
}

ThemeData greenLight() {
  return ThemeData.light().copyWith(
    textTheme: TextTheme(
      headlineMedium: GTheme.big.copyWith(color: GTheme.green, fontSize: 140),
      headlineSmall: GTheme.big.copyWith(color: GTheme.green, fontSize: 90),
      titleLarge: GTheme.big.copyWith(color: GTheme.green, fontSize: 80),
      bodyMedium: GTheme.big.copyWith(color: GTheme.green),
      bodySmall: GTheme.smaller.copyWith(color: GTheme.green),
    ),
  );
}
