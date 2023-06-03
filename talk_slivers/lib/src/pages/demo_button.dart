import 'package:flutter/material.dart';
import 'package:talk_slivers/src/images.dart';

class DemoTime extends StatelessWidget {
  const DemoTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Images.demo,
              package: Images.package,
            ),
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
