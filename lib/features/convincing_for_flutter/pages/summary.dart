import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:presentation/effects.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GTheme.green,
      padding: const EdgeInsets.all(30),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48),
              child: ParallaxWidget(
                child: Text(
                  'Thank you!',
                  textAlign: TextAlign.center,
                  style: GTheme.big.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: DefaultTextStyle(
              style: GTheme.smaller.copyWith(color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('Tomek Polański'),
                  SizedBox(height: 5),
                  Text('@tpolansk'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
