import 'package:flutter/material.dart';

class DemoTime extends StatelessWidget {
  const DemoTime({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: AssetImage('assets/demo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: new Center(
          child: new Text(
            'Demo Time!',
            style: Theme.of(context).textTheme.display2.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
