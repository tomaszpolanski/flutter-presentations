import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PresentationController {
  final PageController controller;
  final RawKeyboard _keyboard = RawKeyboard.instance;
  final List<VoidCallback> _listeners = <VoidCallback>[];

  PresentationController({@required this.controller})
      : assert(controller != null) {
    _keyboard.addListener(_handleKey);
  }

  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
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
            _next();
            break;
          default:
            break;
        }
      }
    }
  }

  void _next() {
    final page = controller.page;
    if (page.floor() - page == 0.0) {
      if (_listeners.isEmpty) {
        next();
      } else {
        for (VoidCallback listener in _listeners) {
          listener();
        }
      }
    }
  }

  void previous() {
    final page = controller.page;
    if (page.floor() - page == 0.0) {
      controller.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void next() {
    final page = controller.page;
    if (page.floor() - page == 0.0) {
      controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}
