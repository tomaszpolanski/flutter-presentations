import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';
import 'package:flutter_presentations/shared/presentation_stepper.dart';
import 'package:flutter_sidekick/flutter_sidekick.dart';

enum _Step {
  init,
  reuse,
  next,
}

class Reusage extends StatefulWidget {
  const Reusage({Key key, this.controller}) : super(key: key);

  final PresentationController controller;

  @override
  _ReusageState createState() => _ReusageState();
}

class _ReusageState extends State<Reusage> with SingleTickerProviderStateMixin {
  PageStepper<_Step> _stateController;
  SidekickController controller;

  @override
  void initState() {
    super.initState();
    controller = SidekickController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addStatusListener((_) => setState(() {}));
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.reuse,
        forward: () => controller.moveToTarget(context),
        reverse: () => controller.moveToSource(context),
      )
      ..add(
        fromStep: _Step.reuse,
        toStep: _Step.next,
        forward: () => widget.controller.next(),
      )
      ..addListener(() => setState(() {}))
      ..build();
  }

  @override
  void dispose() {
    _stateController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Container(
              width: 480,
              margin: EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _FakeText(),
                      Stack(
                        children: [
                          Sidekick(
                            tag: 'source1',
                            targetTag: 'target1',
                            animationBuilder: (animation) => CurvedAnimation(
                                  parent: animation,
                                  curve: FlippedCurve(Curves.easeOut),
                                ),
                            child: const _ReuseItem(color: Colors.black),
                          ),
                          Sidekick(
                            tag: 'source2',
                            targetTag: 'target2',
                            child: const _ReuseItem(color: Colors.black),
                          ),
                          Sidekick(
                            tag: 'source3',
                            targetTag: 'target3',
                            child: const _ReuseItem(color: Colors.black),
                          ),
                          Sidekick(
                            tag: 'source4',
                            targetTag: 'target4',
                            child: const _ReuseItem(color: Colors.black),
                          ),
                          Sidekick(
                            tag: 'source5',
                            targetTag: 'target5',
                            child: const _ReuseItem(color: Colors.black),
                          ),
                          const _ReuseItem(color: Colors.black),
                        ],
                      ),
                      _PlaceholderItem(
                        child: _Sidekick(
                          tag: 'target1',
                          visible: !(controller.status ==
                                  AnimationStatus.forward ||
                              controller.status == AnimationStatus.dismissed),
                          child: _ReuseItem(color: GTheme.flutter1),
                        ),
                      ),
                      _PlaceholderItem(
                        child: _Sidekick(
                          tag: 'target2',
                          visible: !(controller.status ==
                                  AnimationStatus.forward ||
                              controller.status == AnimationStatus.dismissed),
                          child: _ReuseItem(color: GTheme.flutter3),
                        ),
                      ),
                      _PlaceholderItem(
                        child: _Sidekick(
                          tag: 'target3',
                          visible: !(controller.status ==
                                  AnimationStatus.forward ||
                              controller.status == AnimationStatus.dismissed),
                          child: _ReuseItem(color: GTheme.flutter2),
                        ),
                      ),
                      _PlaceholderItem(
                        child: _Sidekick(
                          tag: 'target4',
                          visible: !(controller.status ==
                                  AnimationStatus.forward ||
                              controller.status == AnimationStatus.dismissed),
                          child: _ReuseItem(color: GTheme.flutter1),
                        ),
                      ),
                      _PlaceholderItem(
                        child: _Sidekick(
                          tag: 'target5',
                          visible: !(controller.status ==
                                  AnimationStatus.forward ||
                              controller.status == AnimationStatus.dismissed),
                          child: _ReuseItem(color: GTheme.flutter3),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Widget Reuse',
              textAlign: TextAlign.center,
              style: GTheme.big.copyWith(color: GTheme.flutter2),
            ),
          ),
        ),
      ],
    );
  }
}

class _Sidekick extends StatelessWidget {
  const _Sidekick({
    Key key,
    this.visible,
    this.child,
    this.tag,
  }) : super(key: key);

  final Widget child;
  final bool visible;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Sidekick(
      tag: tag,
      flightShuttleBuilder: (
        BuildContext flightContext,
        Animation<double> animation,
        SidekickFlightDirection flightDirection,
        BuildContext fromSidekickContext,
        BuildContext toSidekickContext,
      ) =>
          child,
      child: Visibility(
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        visible: visible,
        child: child,
      ),
    );
  }
}

class _PlaceholderItem extends StatelessWidget {
  const _PlaceholderItem({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: GTheme.flutter1, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          child,
          _FakeText(),
        ],
      ),
    );
  }
}

class _FakeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [100.0, 50.0, 70.0, 140.0, 70.0]
          .map((width) => _FakeTextBlock(width: width))
          .toList(growable: false),
    );
  }
}

class _ReuseItem extends StatelessWidget {
  const _ReuseItem({
    Key key,
    this.color = Colors.black,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        children: <Widget>[
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          )
        ]..addAll([100.0, 50.0].map((width) => _FakeTextBlock(
              width: width,
              color: color,
            ))),
      ),
    );
  }
}

class _FakeTextBlock extends StatelessWidget {
  const _FakeTextBlock({
    Key key,
    this.width,
    this.color = const Color(0xFFE0E0E0),
  }) : super(key: key);
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: width,
      color: color,
      margin: EdgeInsets.all(4),
    );
  }
}
