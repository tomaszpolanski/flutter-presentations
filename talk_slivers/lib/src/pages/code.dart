import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:talk_slivers/src/images.dart';

enum _Step {
  init,
  loadOfCode,
}

class LoadsOfCode extends StatefulWidget {
  const LoadsOfCode({super.key, required this.controller});

  final PresentationController? controller;

  @override
  _LoadsOfCodeState createState() => _LoadsOfCodeState();
}

class _LoadsOfCodeState extends State<LoadsOfCode>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> animation;
  late Animation<double> opacity;
  late PageStepper<_Step> pageStepper;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    animation = Tween<Offset>(
      begin: const Offset(0, -4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, .1),
      ),
    )..addListener(() => setState(() {}));

    pageStepper = PageStepper<_Step>(
      controller: widget.controller!,
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
      child: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Images.code,
              package: Images.package,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: DefaultTextStyle(
            style: Theme.of(context)
                .textTheme
                .displaySmall!
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
          ),
        ),
      ),
    );
  }
}
