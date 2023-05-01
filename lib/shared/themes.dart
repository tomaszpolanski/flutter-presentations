import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';

ThemeData blueLight() {
  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      headlineSmall: GTheme.big.copyWith(color: GTheme.flutter3, fontSize: 140),
      headlineSmall: GTheme.big.copyWith(color: GTheme.flutter2, fontSize: 90),
      titleLarge: GTheme.big.copyWith(color: GTheme.flutter2, fontSize: 80),
      bodyMedium: GTheme.big.copyWith(color: GTheme.flutter2),
      bodySmall: GTheme.smaller.copyWith(color: GTheme.flutter1),
    ),
  );
}

ThemeData blueDark() {
  return ThemeData.dark().copyWith(
    primaryColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
    ),
    textTheme: TextTheme(
      headlineSmall: GTheme.big.copyWith(color: GTheme.flutter3, fontSize: 140),
      headlineSmall: GTheme.big.copyWith(color: GTheme.flutter3, fontSize: 90),
      titleLarge: GTheme.big.copyWith(color: GTheme.flutter3, fontSize: 80),
      bodyMedium: GTheme.big.copyWith(color: GTheme.flutter2),
      bodySmall: GTheme.smaller.copyWith(color: GTheme.flutter3),
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
