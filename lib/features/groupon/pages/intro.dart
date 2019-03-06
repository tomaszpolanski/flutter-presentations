import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/blueprint.jpg'),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              Colors.white,
              Colors.white,
              Colors.transparent,
              Colors.transparent,
            ],
            stops: const [0, 0.3, 0.9, 1],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: DefaultTextStyle.merge(
                  style: GTheme.big.copyWith(color: GTheme.flutter2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Flutter,'),
                      SizedBox(height: 30),
                      Text('Architecture,'),
                      SizedBox(height: 30),
                      Text('& True Code Reusability.'),
                    ],
                  ),
                ),
              ),
              DefaultTextStyle.merge(
                style: GTheme.smaller.copyWith(color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Tomek Polański',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '@tpolansk',
                      style: TextStyle(color: GTheme.flutter1),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
