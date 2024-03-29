import 'package:flutter/material.dart';
import 'package:presentation/effects.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_ui/shared_ui.dart';

class Composable extends StatefulWidget {
  const Composable(
    this.controller, {
    super.key,
  });
  final PresentationController controller;

  @override
  _ComposableState createState() => _ComposableState();
}

enum _Step {
  init,
  flutter,
  next,
}

class _ComposableState extends State<Composable>
    with SingleTickerProviderStateMixin {
  late PageStepper<_Step> _stateController;
  RevolvingState _revolvingState = RevolvingState.showFirst;

  @override
  void initState() {
    super.initState();
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.flutter,
        forward: () => setState(() {
          _revolvingState = RevolvingState.showSecond;
        }),
        reverse: () => setState(() {
          _revolvingState = RevolvingState.showFirst;
        }),
      )
      ..add(
        fromStep: _Step.flutter,
        toStep: _Step.next,
        forward: widget.controller.nextSlide,
      )
      ..build();
  }

  @override
  void dispose() {
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.bodyMedium,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const ParallaxWidget(child: Text('composable')),
          const Text('+'),
          const ParallaxWidget(child: Text('small chunks')),
          const Text('='),
          ParallaxWidget(
            child: RevolvingWidget(
              firstChild: const Text('reusable'),
              secondChild: const Text('Flutter'),
              state: _revolvingState,
            ),
          )
        ],
      ),
    );
  }
}
