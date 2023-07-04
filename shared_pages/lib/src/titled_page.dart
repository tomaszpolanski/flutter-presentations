import 'package:flutter/material.dart';
import 'package:presentation/effects.dart';

class TitledPage extends StatelessWidget {
  const TitledPage({
    super.key,
    required this.title,
    required this.child,
  });

  final Widget title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: ParallaxWidget(
              translationFactor: 150,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  color: Theme.of(context).textTheme.titleLarge?.color,
                  height: 8,
                  width: 100,
                ),
              ),
            ),
          ),
          DefaultTextStyle.merge(
            style: Theme.of(context).textTheme.titleLarge,
            child: title,
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
