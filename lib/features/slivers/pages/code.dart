import 'package:flutter/material.dart';

class LoadsOfCode extends StatefulWidget {
  final VoidCallback onNext;

  const LoadsOfCode({Key key, @required this.onNext}) : super(key: key);
  @override
  _LoadsOfCodeState createState() => new _LoadsOfCodeState();
}

class _LoadsOfCodeState extends State<LoadsOfCode>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> animation;
  Animation<double> opacity;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    animation = new Tween<Offset>(
      begin: const Offset(0.0, -4.0),
      end: Offset.zero,
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    opacity = new Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.0, .1),
    ))
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        if (_controller.status != AnimationStatus.completed) {
          _controller.forward(from: .0);
        } else {
          widget.onNext();
        }
      },
      child: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: AssetImage('assets/code.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: new Center(
            child: new DefaultTextStyle(
          style: Theme
              .of(context)
              .textTheme
              .display2
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Loads of Code'),
              new SlideTransition(
                position: animation,
                child: new Opacity(
                  opacity: opacity.value,
                  child: const Text('!'),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
