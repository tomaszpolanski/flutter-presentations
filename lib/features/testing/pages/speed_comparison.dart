import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:process_run/shell.dart';

class SpeedComparison extends StatefulWidget {
  const SpeedComparison(
    this.controller, {
    @required this.driverTest,
    @required this.unitTest,
    Key key,
  }) : super(key: key);
  final PresentationController controller;
  final String driverTest;
  final String unitTest;

  @override
  _SpeedComparisonState createState() => _SpeedComparisonState();
}

enum _Step {
  init,
  countdown,
  go,
  done,
  next,
}

class _SpeedComparisonState extends State<SpeedComparison>
    with TickerProviderStateMixin {
  PageStepper<_Step> _stateController;
  AnimationController _controller;
  TextEditingController _driverController;
  TextEditingController _widgetController;
  String _driverTime;
  String _widgetTime;

  bool _showCountdown = false;
  bool _showTimer = false;
  bool _runTimer = false;

  @override
  void initState() {
    _driverController = TextEditingController();
    _widgetController = TextEditingController();
    _controller = AnimationController(vsync: this);
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.countdown,
        forward: () => _showCountdown = true,
        reverse: () => _showCountdown = false,
      )
      ..add(
        fromStep: _Step.countdown,
        toStep: _Step.go,
        forward: () async {
          _showTimer = true;
          _runTimer = true;
          await _runComparison();
          _stateController.next();
        },
        reverse: () {
          _showTimer = false;
          _runTimer = false;
        },
      )
      ..add(
        fromStep: _Step.go,
        toStep: _Step.done,
        forward: () => _runTimer = false,
        reverse: () {},
      )
      ..add(
        fromStep: _Step.done,
        toStep: _Step.next,
        forward: widget.controller.nextSlide,
      )
      ..addListener(() => setState(() {}))
      ..build();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _stateController.dispose();
    _driverController.dispose();
    _widgetController.dispose();
    super.dispose();
  }

  Future<void> _runComparison() {
    return Future.wait([
      _runDriverTests(),
      _runTests(),
    ]);
  }

  Future<void> _runDriverTests() async {
    final duration = await _runTestCommand(
      widget.driverTest,
      controller: _driverController,
    );
    setState(() {
      _driverTime = duration.inSeconds.toString();
    });
  }

  Future<void> _runTests() async {
    final duration = await _runTestCommand(
      widget.unitTest,
      controller: _widgetController,
    );
    setState(() {
      _widgetTime = duration.inSeconds.toString();
    });
  }

  Future<Duration> _runTestCommand(
    String command, {
    @required TextEditingController controller,
  }) async {
    final StreamController<List<int>> output = StreamController();
    output.stream.transform(utf8.decoder).listen((data) {
      setState(() {
        controller.text = '${controller.text}\n$data';
      });
    }, onError: (dynamic error) {
      setState(() {
        controller.text = '${controller.text}\n$error';
      });
    });
    final start = DateTime.now();
    await Shell(stdout: output).run(command);
    final duration = DateTime.now().difference(start);
    await output.close();
    return duration;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        const Text('Driver Tests'),
                        Expanded(
                          child: SingleChildScrollView(
                            reverse: true,
                            child: TextField(
                              enabled: false,
                              controller: _driverController,
                              maxLines: null,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                        ),
                        Text(
                          _driverTime != null
                              ? 'Duration: ${_driverTime}s'
                              : '',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        const Text('Widget Tests'),
                        Expanded(
                          child: SingleChildScrollView(
                            reverse: true,
                            child: TextField(
                              enabled: false,
                              controller: _widgetController,
                              maxLines: null,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                        ),
                        Text(
                          _widgetTime != null
                              ? 'Duration: ${_widgetTime}s'
                              : '',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _showTimer,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: _Timer(running: _runTimer),
            ),
            const SizedBox(height: 200),
          ],
        ),
        if (_showCountdown)
          Center(
            child: _CountDownWidget(
              const Duration(seconds: 5),
              onDone: _stateController.next,
            ),
          ),
      ],
    );
  }
}

class _CountDownWidget extends StatefulWidget {
  const _CountDownWidget(
    this.duration, {
    this.onDone,
    Key key,
  }) : super(key: key);

  final Duration duration;
  final VoidCallback onDone;

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<_CountDownWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed && widget.onDone != null) {
          widget.onDone();
        }
      })
      ..forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WrappedAnimatedBuilder<double>(
      animation: CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
      builder: (context, animation, _) {
        final time = _controller.duration.inSeconds -
            (_controller.value * _controller.duration.inSeconds).floor();
        final scale = (_controller.value * _controller.duration.inSeconds) -
            (_controller.value * _controller.duration.inSeconds).floor();
        return Transform.scale(
          scale: scale,
          child: Text(
            time.toString(),
            style: Theme.of(context).textTheme.headline4,
          ),
        );
      },
    );
  }
}

class _Timer extends StatefulWidget {
  const _Timer({
    Key key,
    @required this.running,
  }) : super(key: key);

  final bool running;

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<_Timer> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(days: 1),
    );
    if (widget.running) {
      _controller.forward();
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(_Timer oldWidget) {
    if (oldWidget.running != widget.running) {
      if (widget.running) {
        _controller.forward(from: 0);
      } else {
        _controller.stop();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final seconds = _controller.duration.inSeconds * _controller.value;
        final kindaMilliseconds =
            ((seconds - seconds.floor()) * 100).clamp(0, 99).floor();

        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Expanded(
              child: Text(
                seconds.floor().toString(),
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.end,
              ),
            ),
            Expanded(
              child: Text(
                kindaMilliseconds < 10
                    ? '0$kindaMilliseconds'
                    : '$kindaMilliseconds',
              ),
            ),
          ],
        );
      },
    );
  }
}
