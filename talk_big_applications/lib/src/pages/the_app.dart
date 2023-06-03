import 'package:flutter/material.dart';

import 'package:presentation/presentation.dart';
import 'package:shared_pages/shared_pages.dart';

class TheApp extends StatelessWidget {
  const TheApp(
    this.controller, {
    super.key,
  });

  final PresentationController controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.headlineSmall,
      child: StackedPage(
        controller: controller,
        children: const [
          Text('🧑👧 500,000+'),
          Text('📃 90'),
          Text('✅ 4800'),
          Text('✅📱 260'),
        ],
      ),
    );
  }
}
