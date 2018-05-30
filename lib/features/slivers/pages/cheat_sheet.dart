import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_presentations/shared/presentation_page.dart';

class CheatSheet extends StatefulWidget {
  @override
  CheatSheetState createState() {
    return new CheatSheetState();
  }
}

class CheatSheetState extends State<CheatSheet> with TickerProviderStateMixin {
  AnimationController pageViewController;
  AnimationController multiChildController;

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
  }

  Animation<Offset> _createAnimation(AnimationController controller) {
    return new Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
      new CurvedAnimation(
        parent: controller,
        curve: new ElasticOutCurve(),
      ),
    );
  }

  @override
  void dispose() {
    pageViewController.dispose();
    multiChildController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new PresentationPage(
      title: const Text('Cheat Sheet'),
      child: new GestureDetector(
        onTap: () {
          if (pageViewController.status == AnimationStatus.dismissed) {
            pageViewController.forward();
          } else if (multiChildController.status != AnimationStatus.completed) {
            multiChildController.forward();
          }
        },
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

class CurvedController implements ValueListenable<double> {
  final AnimationController _controller;
  final Curve curve;

  CurvedController({
    @required TickerProvider vsync,
    @required Duration duration,
    @required this.curve,
  }) : _controller = new AnimationController(duration: duration, vsync: vsync);

  @override
  void addListener(VoidCallback listener) {
    _controller.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _controller.removeListener(listener);
  }

  @override
  double get value => curve.transform(_controller.value);

  void dispose() {
    _controller.dispose();
  }

  void start() {
    _controller.forward();
  }
}

class CardElement extends StatelessWidget {
  final String text;

  const CardElement(
    this.text, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(30.0),
      child: new Container(
        height: double.infinity,
        width: double.infinity,
        child: new Card(
          child: new Center(
            child: new Text(text, style: new TextStyle(fontSize: 30.0)),
          ),
        ),
      ),
    );
  }
}
