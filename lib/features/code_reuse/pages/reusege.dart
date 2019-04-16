import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';

class BigWidget extends StatelessWidget {
  const BigWidget({Key key, this.controller}) : super(key: key);
  final PresentationController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Image.asset('assets/start.png');
        } else if (index == 999) {
          return Image.asset('assets/end.png');
        } else {
          return Image.asset('assets/mid.png');
        }
      },
    );
  }
}
