import 'package:flutter/material.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';

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
