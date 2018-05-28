import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CheatSheet extends StatefulWidget {
  @override
  CheatSheetState createState() {
    return new CheatSheetState();
  }
}

class CheatSheetState extends State<CheatSheet> with TickerProviderStateMixin {
  CurvedController firstItemController;
  CurvedController secondItemController;

  @override
  void initState() {
    super.initState();

    firstItemController = new CurvedController(
      duration: const Duration(milliseconds: 800),
      curve: new ElasticOutCurve(),
      vsync: this,
    );
    secondItemController = new CurvedController(
      duration: const Duration(milliseconds: 800),
      curve: new ElasticOutCurve(),
      vsync: this,
    );
  }

  @override
  void dispose() {
    firstItemController.dispose();
    secondItemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return new GestureDetector(
      onTap: () {
        if (firstItemController.value == 0.0) {
          firstItemController.start();
        } else {
          secondItemController.start();
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
                child: new AnimatedBuilder(
                  animation: firstItemController,
                  child: new CardElement('CustomMultiChildLayout'),
                  builder: (BuildContext context, Widget child) {
                    return new Transform.translate(
                      offset:
                          new Offset(width * (1 - firstItemController.value), .0),
                      child: child,
                    );
                  },
                ),
              ),
              new Flexible(
                child: new AnimatedBuilder(
                  animation: secondItemController,
                  child: new CardElement('PageView'),
                  builder: (BuildContext context, Widget child) {
                    return new Transform.translate(
                      offset: new Offset(
                          width * (1 - secondItemController.value), .0),
                      child: child,
                    );
                  },
                ),
              ),
            ],
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
