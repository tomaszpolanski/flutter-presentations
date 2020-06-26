import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

import 'file:///C:/Users/tpolanski/Documents/GitHub/flutter-presentations/lib/shared/stacked_page.dart';

class Tools extends StatelessWidget {
  const Tools(
    this.controller, {
    Key key,
  }) : super(key: key);
  final PresentationController controller;

  @override
  Widget build(BuildContext context) {
    return StackedPage(
      controller: controller,
      children: const [
        Text('🗡️ Dagger'),
        Text('🖧 Okhttp '),
        Text('🏠 Room'),
        Text('🚀 Jetpack'),
        Text('... tools.'),
      ],
    );
  }
}
