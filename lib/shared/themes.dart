import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';

ThemeData blueLight() {
  return ThemeData.light().copyWith(
    textTheme: TextTheme(
      headline4: GTheme.big.copyWith(color: GTheme.flutter3, fontSize: 140),
      headline5: GTheme.big.copyWith(color: GTheme.flutter2, fontSize: 90),
      headline6: GTheme.big.copyWith(color: GTheme.flutter2, fontSize: 80),
      bodyText2: GTheme.big.copyWith(color: GTheme.flutter2),
      caption: GTheme.smaller.copyWith(color: GTheme.flutter1),
    ),
  );
}

ThemeData blueDark() {
  return ThemeData.dark().copyWith(
    primaryColor: Colors.white,
    accentColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
    ),
    textTheme: TextTheme(
      headline4: GTheme.big.copyWith(color: GTheme.flutter3, fontSize: 140),
      headline5: GTheme.big.copyWith(color: GTheme.flutter3, fontSize: 90),
      headline6: GTheme.big.copyWith(color: GTheme.flutter3, fontSize: 80),
      bodyText2: GTheme.big.copyWith(color: GTheme.flutter2),
      caption: GTheme.smaller.copyWith(color: GTheme.flutter3),
    ),
  );
}

ThemeData greenLight() {
  return ThemeData.light().copyWith(
    textTheme: TextTheme(
      headline4: GTheme.big.copyWith(color: GTheme.green, fontSize: 140),
      headline5: GTheme.big.copyWith(color: GTheme.green, fontSize: 90),
      headline6: GTheme.big.copyWith(color: GTheme.green, fontSize: 80),
      bodyText2: GTheme.big.copyWith(color: GTheme.green),
      caption: GTheme.smaller.copyWith(color: GTheme.green),
    ),
  );
}
