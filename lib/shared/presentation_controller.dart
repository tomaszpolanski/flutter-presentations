import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PresentationController {
  final PageController controller;
  final RawKeyboard _keyboard = RawKeyboard.instance;

  PresentationController({@required this.controller})
      : assert(controller != null) {
    _keyboard.addListener(_handleKey);
  }

  void dispose() {
    _keyboard.removeListener(_handleKey);
  }

  void _handleKey(RawKeyEvent value) {
    if (value is RawKeyUpEvent) {
      if (value.data is RawKeyEventDataAndroid) {
        final RawKeyEventDataAndroid data = value.data;
        switch (data.keyCode) {
          case 20:
          case 21:
            previous();
            break;
          case 19:
          case 22:
            next();
            break;
          default:
            break;
        }
      }
    }
  }

  void previous() {
    controller.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void next() {
    controller.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
