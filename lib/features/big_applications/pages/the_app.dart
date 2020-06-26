import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';

class TheApp extends StatelessWidget {
  const TheApp(
    this.controller, {
    Key key,
  }) : super(key: key);
  final PresentationController controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.headline5,
      child: StackedPage(
        controller: controller,
        children: const [
          Text('🧑👧 500,000+'),
          Text('📃 91'),
          Text('✅ 4800'),
          Text('✅📱 257'),
        ],
      ),
    );
  }
}

class _AppItem extends StatelessWidget {
  const _AppItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}
