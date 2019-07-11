import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

enum _Step {
  init,
  pageView,
  multiChild,
}

class CheatSheet extends StatefulWidget {
  const CheatSheet({Key key, @required this.controller}) : super(key: key);
  final PresentationController controller;

  @override
  CheatSheetState createState() => CheatSheetState();
}

class CheatSheetState extends State<CheatSheet> with TickerProviderStateMixin {
  AnimationController pageViewController;
  AnimationController multiChildController;
  PageStepper<_Step> stateController;

  @override
  void initState() {
    super.initState();

    pageViewController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    multiChildController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..addStep(_Step.init, _Step.pageView, () {
        pageViewController.forward();
      })
      ..addStep(_Step.pageView, _Step.multiChild, () {
        multiChildController.forward();
      })
      ..addStep(_Step.multiChild, _Step.pageView, () {
        multiChildController.reverse();
      })
      ..addStep(_Step.pageView, _Step.init, () {
        pageViewController.reverse();
      })
      ..build();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    multiChildController.dispose();
    stateController.dispose();
    super.dispose();
  }

  Animation<Offset> _createAnimation(AnimationController controller) {
    return Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: const ElasticOutCurve(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return PresentationPage(
      title: const Text('Cheat Sheet'),
      child: GestureDetector(
        onTap: stateController.next,
        child: ClipRect(
          child: Container(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: SlideTransition(
                    position: _createAnimation(pageViewController),
                    child: const CardElement('PageView'),
                  ),
                ),
                Flexible(
                  child: SlideTransition(
                    position: _createAnimation(multiChildController),
                    child: const CardElement('CustomMultiChildLayout'),
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

class CardElement extends StatelessWidget {
  const CardElement(
    this.text, {
    Key key,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Card(
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
