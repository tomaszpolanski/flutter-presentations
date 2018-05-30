import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';

class DemoTime extends StatelessWidget {
  final String title;

  const DemoTime(this.title, {Key key}) : super(key: key);

  void _openLinkInGoogleChrome() {
    new AndroidIntent(
            action: 'android.intent.action.MAIN',
            category: 'android.intent.category.LAUNCHER',
            package: 'io.flutter.demo.gallery')
        .launch();
  }

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: _openLinkInGoogleChrome,
      child: new Text(
        title,
        style: Theme.of(context).textTheme.headline,
      ),
    );
  }
}
