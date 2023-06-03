import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_pages/shared_pages.dart';

class FlutterContainer extends StatelessWidget {
  const FlutterContainer(
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
          Text('Padding'),
          Text('ConstrainedBox'),
          Text('Align'),
          Text('ColoredBox'),
          Text('Transform'),
        ],
      ),
    );
  }
}
