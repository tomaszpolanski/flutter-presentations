import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Container(
        color: GTheme.green,
        padding: EdgeInsets.all(30.0),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: Text('Thank you!',
                    textAlign: TextAlign.center,
                    style: GTheme.big.copyWith(color: Colors.white)),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: new DefaultTextStyle(
                style: GTheme.small.copyWith(color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('Tomek Polański'),
                    SizedBox(height: 5.0),
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
