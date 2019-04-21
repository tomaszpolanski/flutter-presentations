import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const pageUpKey = 266;
const pageDownKey = 267;
const leftKey = 263;
const rightKey = 262;

class PresentationController {
  PresentationController({@required this.controller})
      : assert(controller != null) {
    _keyboard.addListener(_handleKey);
  }

  final PageController controller;
  final RawKeyboard _keyboard = RawKeyboard.instance;
  final List<ValueChanged<PageAction>> _listeners =
      <ValueChanged<PageAction>>[];

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
          case leftKey:
          case pageUpKey:
            _sendAction(PageAction.previous);
            break;
          case 19:
          case 22:
          case rightKey:
          case pageDownKey:
            _sendAction(PageAction.next);
            break;
          default:
            break;
        }
      }
    }
  }

  void nextStep() {
    _sendAction(PageAction.next);
  }

  void previousStep() {
    _sendAction(PageAction.previous);
  }

  void _sendAction(PageAction action) {
    if (_listeners.isEmpty) {
      switch (action) {
        case PageAction.next:
          nextSlide();
          break;
        case PageAction.previous:
          previousSlide();
          break;
        default:
          print('Unknown action: $action');
      }
    } else {
      for (ValueChanged<PageAction> listener in _listeners) {
        listener(action);
      }
    }
  }

  void previousSlide() {
    controller.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void nextSlide() {
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
