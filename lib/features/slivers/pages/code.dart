import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

enum _Step {
  init,
  loadOfCode,
}

class LoadsOfCode extends StatefulWidget {
  const LoadsOfCode({Key key, @required this.controller}) : super(key: key);
  final PresentationController controller;

  @override
  _LoadsOfCodeState createState() => _LoadsOfCodeState();
}

class _LoadsOfCodeState extends State<LoadsOfCode>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> animation;
  Animation<double> opacity;
  PageStepper<_Step> pageStepper;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    animation = Tween<Offset>(
      begin: const Offset(0.0, -4.0),
      end: Offset.zero,
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, .1),
    ))
      ..addListener(() => setState(() {}));

    pageStepper = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..addStep(
        _Step.init,
        _Step.loadOfCode,
        () => _controller.forward(),
      )
      ..addStep(
        _Step.loadOfCode,
        _Step.init,
        () => _controller.reverse(),
      )
      ..build();
  }

  @override
  void dispose() {
    pageStepper.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pageStepper.next,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/code.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: DefaultTextStyle(
          style: Theme.of(context)
              .textTheme
              .display2
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Loads of Code'),
              SlideTransition(
                position: animation,
                child: Opacity(
                  opacity: opacity.value,
                  child: const Text('!'),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
