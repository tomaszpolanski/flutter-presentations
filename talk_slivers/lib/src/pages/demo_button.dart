import 'package:flutter/material.dart';

class DemoTime extends StatelessWidget {
  const DemoTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/demo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'Demo Time!',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
