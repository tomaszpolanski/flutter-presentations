import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:presentation/parallax_effect.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
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
                style: Theme.of(context).textTheme.headline,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline,
                        text: 'True ',
                        children: [
                          TextSpan(
                            text: 'Code',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          TextSpan(
                            text: '\nEffort ',
                            style: TextStyle(color: GTheme.flutter3),
                          ),
                          TextSpan(text: 'Reusability'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DefaultTextStyle.merge(
              style: Theme.of(context).textTheme.caption,
              child: ParallaxWidget(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Tomek Polański',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text('@tpolansk'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
