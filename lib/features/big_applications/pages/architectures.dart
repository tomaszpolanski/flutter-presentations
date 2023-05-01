import 'package:flutter/material.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';

class Architectures extends StatelessWidget {
  const Architectures(
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
          Text('MVC'),
          Text('MVP'),
          Text('MVVM'),
          Text('MVI'),
          Text('MVWE'),
          Text('Bloc'),
          Text('Redux'),
        ],
      ),
    );
  }
}
