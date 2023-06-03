import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_pages/shared_pages.dart';

class Tools extends StatelessWidget {
  const Tools(
    this.controller, {
    super.key,
  });
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
