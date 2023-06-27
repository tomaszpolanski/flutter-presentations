import 'package:flutter/material.dart';
import 'package:shared_ui/shared_ui.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 120, right: 30),
                      child: Text('But', style: TextStyle(fontSize: 180)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50, right: 30),
                      child: Text('does', style: TextStyle(fontSize: 90)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: Text('it', style: TextStyle(fontSize: 50)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Text('Scale', style: TextStyle(fontSize: 180)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.translate(
                offset: Offset(0, -70),
                child: Text('?', style: TextStyle(fontSize: 240)),
              ),
              Transform.scale(
                scale: 1,
                child: Orb(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
