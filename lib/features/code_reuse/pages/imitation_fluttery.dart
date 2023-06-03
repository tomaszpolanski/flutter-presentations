import 'package:flutter/material.dart';
import 'package:presentation/effects.dart';
import 'package:shared_theme/shared_theme.dart';

class Imitation extends StatelessWidget {
  const Imitation({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: Tooltip(
        message: 'Charles Caleb Colton',
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 160,
              child: ParallaxWidget(
                child: Icon(
                  Icons.format_quote,
                  color: GTheme.flutter3.withOpacity(0.15),
                  size: 450,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.black),
                    children: const [
                      TextSpan(
                        text: 'Imitation is the sincerest form of Fl',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      TextSpan(
                        text: 'u',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: GTheme.flutter2,
                        ),
                      ),
                      TextSpan(
                        text: 'ttery',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
