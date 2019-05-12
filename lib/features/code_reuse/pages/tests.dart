import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/presentation.dart';

class Tests extends StatefulWidget {
  const Tests({Key key, this.controller}) : super(key: key);
  final PresentationController controller;

  @override
  _TestsState createState() => _TestsState();
}

enum _Step {
  init,
  highlighted,
  color_changed,
  next,
}

class _TestsState extends State<Tests> {
  PageStepper<_Step> _stateController;
  TextStyle _style;

  @override
  void initState() {
    super.initState();
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.highlighted,
        forward: () => setState(
            () => _style = _style.copyWith(fontWeight: FontWeight.bold)),
        reverse: () => setState(
            () => _style = _style.copyWith(fontWeight: FontWeight.normal)),
      )
      ..add(
        fromStep: _Step.highlighted,
        toStep: _Step.color_changed,
        forward: () =>
            setState(() => _style = _style.copyWith(color: Colors.green)),
        reverse: () =>
            setState(() => _style = _style.copyWith(color: Colors.red)),
      )
      ..add(
        fromStep: _Step.color_changed,
        toStep: _Step.next,
        forward: widget.controller.nextSlide,
      )
      ..addListener(() => setState(() {}))
      ..build();
  }

  @override
  void dispose() {
    _stateController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _style = Theme.of(context).textTheme.body1.copyWith(
          fontWeight: FontWeight.normal,
          color: Colors.red,
        );
  }

  @override
  Widget build(BuildContext context) {
    final description = Theme.of(context).textTheme.body1.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        );
    final good = description.copyWith(
      fontWeight: FontWeight.normal,
      color: Colors.green,
    );
    final medium = good.copyWith(color: Colors.orange);
    final bad = good.copyWith(color: Colors.red);

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Tests',
            style: Theme.of(context).textTheme.title,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Center(
            child: Table(
              columnWidths: const {
                0: const FlexColumnWidth(2),
                1: const FlexColumnWidth(1),
                2: const FlexColumnWidth(1),
                3: const FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  children: [
                    SizedBox(),
                    Text('Unit', style: description),
                    Text('Widget', style: description),
                    Text('Integration', style: description),
                  ]
                      .map((widget) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: widget,
                          ))
                      .toList(),
                ),
                TableRow(
                  key: Key('confidence'),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  children: [
                    Text('Confidence', style: description),
                    Text('Low', style: bad),
                    Text('Higher', style: medium),
                    Text('Highest', style: good),
                  ]
                      .map((widget) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: widget,
                          ))
                      .toList(),
                ),
                TableRow(
                  key: Key('cost'),
                  children: [
                    Text('Maintenance cost', style: description),
                    Text('Low', style: good),
                    Text('Higher', style: medium),
                    Text('Highest', style: bad),
                  ]
                      .map((widget) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: widget,
                          ))
                      .toList(),
                ),
                TableRow(
                  key: Key('speed'),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  children: [
                    Text('Execution speed', style: description),
                    Text('Quick', style: good),
                    Text('Slower', style: medium),
                    AnimatedDefaultTextStyle(
                        style: _style,
                        duration: Duration(milliseconds: 400),
                        child: Text('Slowest')),
                  ]
                      .map((widget) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: widget,
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
