import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class BigWidget extends StatefulWidget {
  const BigWidget(
    this.controller, {
    super.key,
  });
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
  late PageStepper<_Step> _stateController;
  late ScrollController _controller;

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
          1000000,
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
    return Stack(
      children: <Widget>[
        Container(
          color: const Color(0xFF2B2B2B),
          child: Scrollbar(
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
          ),
        ),
        Positioned(
          bottom: 50,
          right: 50,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              final maxExtent = _controller.position.hasContentDimensions
                  ? _controller.position.maxScrollExtent
                  : 10000;
              return AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: _controller.offset > 0.5 * maxExtent &&
                        _controller.offset < 0.9 * maxExtent
                    ? 1
                    : 0,
                child: child,
              );
            },
            child: Text(
              'Yeah, I know...',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        )
      ],
    );
  }
}
