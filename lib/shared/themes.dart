import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';

ThemeData blueLight() {
  return ThemeData.light().copyWith(
    textTheme: TextTheme(
      display1: GTheme.big.copyWith(color: GTheme.flutter3, fontSize: 140),
      headline: GTheme.big.copyWith(color: GTheme.flutter2, fontSize: 90),
      title: GTheme.big.copyWith(color: GTheme.flutter2, fontSize: 80),
      body1: GTheme.big.copyWith(color: GTheme.flutter2),
      caption: GTheme.smaller.copyWith(color: GTheme.flutter1),
    ),
  );
}

ThemeData greenLight() {
  return ThemeData.light().copyWith(
    textTheme: TextTheme(
      display1: GTheme.big.copyWith(color: GTheme.green, fontSize: 140),
      headline: GTheme.big.copyWith(color: GTheme.green, fontSize: 90),
      title: GTheme.big.copyWith(color: GTheme.green, fontSize: 80),
      body1: GTheme.big.copyWith(color: GTheme.green),
      caption: GTheme.smaller.copyWith(color: GTheme.green),
    ),
  );
}
