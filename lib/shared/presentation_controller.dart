import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PresentationController {
  final PageController controller;
  final RawKeyboard _keyboard = RawKeyboard.instance;
  final List<ValueChanged<PageAction>> _listeners =
      <ValueChanged<PageAction>>[];

  PresentationController({@required this.controller})
      : assert(controller != null) {
    _keyboard.addListener(_handleKey);
  }

  void addListener(ValueChanged<PageAction> listener) {
    _listeners.add(listener);
  }

  void removeListener(ValueChanged<PageAction> listener) {
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
            _sendAction(PageAction.previous);
            break;
          case 19:
          case 22:
            _sendAction(PageAction.next);
            break;
          default:
            break;
        }
      }
    }
  }

  void _sendAction(PageAction action) {
    final page = controller.page;
    if (page.floor() - page == 0.0) {
      if (_listeners.isEmpty) {
        next();
      } else {
        for (ValueChanged<PageAction> listener in _listeners) {
          listener(action);
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
    controller.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}

enum PageAction {
  next,
  previous,
}
