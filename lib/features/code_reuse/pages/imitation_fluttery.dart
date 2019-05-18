import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';

class Imitation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: Tooltip(
        message: 'Charles Caleb Colton',
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .title
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
      ),
    );
  }
}
