import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_presentations/shared/presentation_page.dart';

class CheatSheet extends StatefulWidget {
  final VoidCallback onNext;

  const CheatSheet({Key key, @required this.onNext}) : super(key: key);

  @override
  CheatSheetState createState() => new CheatSheetState();
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
    ).animate(new CurvedAnimation(
      parent: controller,
      curve: new ElasticOutCurve(),
    ));
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
          } else {
            widget.onNext();
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
