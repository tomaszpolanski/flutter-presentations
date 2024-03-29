import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_pages/shared_pages.dart';
import 'package:shared_ui/shared_ui.dart';

class FlutterIsFun extends StatefulWidget {
  const FlutterIsFun(
    this.controller, {
    super.key,
  });
  final PresentationController controller;

  @override
  _FlutterIsFunState createState() => _FlutterIsFunState();
}

enum _Step {
  init,
  flutter,
  next,
}

class _FlutterIsFunState extends State<FlutterIsFun>
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
    return SummaryWidgetPage(
      title: RevolvingWidget(
        firstChild: const Text('Desktop'),
        secondChild: const Text(
          'Flutter',
        ),
        state: _revolvingState,
      ),
      subtitle: const Text('Is Fun'),
    );
  }
}
