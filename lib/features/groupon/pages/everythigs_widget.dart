import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';
import 'package:flutter_presentations/shared/presentation_stepper.dart';

class EverythingsWidget extends StatefulWidget {
  const EverythingsWidget({Key key, this.controller}) : super(key: key);
  final PresentationController controller;

  @override
  _EverythingsWidgetState createState() => _EverythingsWidgetState();
}

enum _Step {
  init,
  asteriks,
  showExample,
  showListTitle,
  showCode,
  next,
}

class _EverythingsWidgetState extends State<EverythingsWidget>
    with SingleTickerProviderStateMixin {
  PageStepper<_Step> _stateController;
  AnimationController _controller;
  bool _showExample = false;
  bool _showTextTitle = true;
  bool _showCode = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.asteriks,
        forward: () => _controller.forward(),
        reverse: () => _controller.reverse(),
      )
      ..add(
        fromStep: _Step.asteriks,
        toStep: _Step.showExample,
        forward: () => setState(() => _showExample = true),
        reverse: () => setState(() => _showExample = false),
      )
      ..add(
        fromStep: _Step.showExample,
        toStep: _Step.showListTitle,
        forward: () => setState(() => _showTextTitle = false),
        reverse: () => setState(() => _showTextTitle = true),
      )
      ..add(
        fromStep: _Step.showListTitle,
        toStep: _Step.showCode,
        forward: () => setState(() => _showCode = true),
        reverse: () => setState(() => _showCode = false),
      )
      ..add(
        fromStep: _Step.showCode,
        toStep: _Step.next,
        forward: () => widget.controller.next(),
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
    final animation = _controller.drive(CurveTween(curve: Curves.easeOut));
    return Stack(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: DefaultTextStyle.merge(
                style: GTheme.big.copyWith(color: GTheme.flutter2),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Everything's a Widget"),
                      AnimatedBuilder(
                        animation: animation,
                        builder: (_, child) {
                          return Transform.rotate(
                            angle: 2 * pi * animation.value / 4,
                            child: Opacity(
                              opacity: animation.value,
                              child: child,
                            ),
                          );
                        },
                        child: Text(
                          '✱',
                          style: TextStyle(
                            fontSize: 30,
                            color: GTheme.flutter1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: AnimatedOpacity(
                  opacity: _showExample ? 1 : 0,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    width: 480,
                    margin: EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Scaffold(
                      appBar: AppBar(
                        title: _showTextTitle
                            ? Text('The Title')
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 100,
                                itemBuilder: (_, __) {
                                  return Container(
                                    color: GTheme.flutter1,
                                    width: 100,
                                    margin: EdgeInsets.all(8),
                                  );
                                },
                              ),
                        automaticallyImplyLeading: true,
                      ),
                      body: Scrollbar(
                        child: ListView.builder(
                          itemCount: 100,
                          itemBuilder: (_, index) {
                            return Container(
                              color: GTheme.flutter1,
                              height: 100,
                              margin: EdgeInsets.all(8),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 80,
          right: 80,
          child: AnimatedOpacity(
            opacity: _showCode ? 1 : 0,
            duration: Duration(milliseconds: 500),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.asset('assets/scrollbar.png'),
            ),
          ),
        )
      ],
    );
  }
}

class EverythigsExample extends StatefulWidget {
  @override
  _EverythigsExampleState createState() => _EverythigsExampleState();
}

class _EverythigsExampleState extends State<EverythigsExample> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 480,
      margin: EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: Text('Hi there'),
        ),
      ),
    );
  }
}
