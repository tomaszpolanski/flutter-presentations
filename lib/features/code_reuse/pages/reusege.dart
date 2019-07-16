import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/presentation.dart';

class BigWidget extends StatefulWidget {
  const BigWidget({Key key, this.controller}) : super(key: key);
  final PresentationController controller;

  @override
  _BigWidgetState createState() => _BigWidgetState();
}

enum _Step {
  init,
  bottom,
  next,
}

class _BigWidgetState extends State<BigWidget> {
  PageStepper<_Step> _stateController;
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.bottom,
        forward: () => _controller.animateTo(
          300000,
          duration: const Duration(seconds: 10),
          curve: Curves.ease,
        ),
        reverse: () => _controller.animateTo(
          0,
          duration: const Duration(seconds: 10),
          curve: Curves.ease,
        ),
      )
      ..add(
        fromStep: _Step.bottom,
        toStep: _Step.next,
        forward: widget.controller.nextSlide,
      )
      ..build();
  }

  @override
  void dispose() {
    _controller.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2B2B2B),
      child: ListView.builder(
        controller: _controller,
        itemCount: 500,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Image.asset(
              'assets/start.png',
              fit: BoxFit.fitWidth,
            );
          } else if (index == 499) {
            return Image.asset(
              'assets/end.png',
              fit: BoxFit.fitWidth,
            );
          } else {
            return Image.asset(
              'assets/mid.png',
              fit: BoxFit.fitWidth,
            );
          }
        },
      ),
    );
  }
}
