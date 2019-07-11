import 'package:flutter/material.dart';

class DemoTime extends StatelessWidget {
  const DemoTime({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/demo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
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
