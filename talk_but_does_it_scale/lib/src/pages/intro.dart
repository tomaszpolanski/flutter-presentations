import 'package:flutter/material.dart';
import 'package:shared_ui/shared_ui.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 120, right: 30),
                      child: Text('But', style: TextStyle(fontSize: 180)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50, right: 30),
                      child: Text('does', style: TextStyle(fontSize: 90)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 120),
                      child: Text('it', style: TextStyle(fontSize: 50)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(),
                    child: Text('Scale', style: TextStyle(fontSize: 180)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.translate(
                offset: const Offset(0, -110),
                child: const ClipRect(
                    clipper: ClipperRect(Rect.fromLTRB(0, 0, 1, 0.6)),
                    child: Text(
                      '?',
                      style: TextStyle(fontSize: 400),
                    )),
              ),
              Transform.scale(
                scale: 1,
                child: const Orb(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
