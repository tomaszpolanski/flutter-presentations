import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation_controller.dart';
import 'package:presentation/presentation_page.dart';
import 'package:presentation/presentation_stepper.dart';

enum _Step {
  init,
  pageView,
  multiChild,
}

class CheatSheet extends StatefulWidget {
  const CheatSheet({Key key, @required this.controller}) : super(key: key);
  final PresentationController controller;

  @override
  CheatSheetState createState() => new CheatSheetState();
}

class CheatSheetState extends State<CheatSheet> with TickerProviderStateMixin {
  AnimationController pageViewController;
  AnimationController multiChildController;
  PageStepper<_Step> stateController;

  @override
  void initState() {
    super.initState();

    pageViewController = new AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    multiChildController = new AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    stateController = new PageStepper<_Step>(
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
    return new Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(new CurvedAnimation(
      parent: controller,
      curve: new ElasticOutCurve(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new PresentationPage(
      title: const Text('Cheat Sheet'),
      child: new GestureDetector(
        onTap: stateController.next,
        child: new ClipRect(
          child: new Container(
            color: Colors.transparent,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Flexible(
                  child: new SlideTransition(
                    position: _createAnimation(pageViewController),
                    child: new CardElement('PageView'),
                  ),
                ),
                new Flexible(
                  child: new SlideTransition(
                    position: _createAnimation(multiChildController),
                    child: new CardElement('CustomMultiChildLayout'),
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
    return new Padding(
      padding: const EdgeInsets.all(30.0),
      child: new Card(
        child: new Center(
          child: new Text(
            text,
            textAlign: TextAlign.center,
            style: new TextStyle(fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}
