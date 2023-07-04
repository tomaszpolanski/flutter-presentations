import 'package:flutter/material.dart';

class FontSwitcher extends InheritedWidget {
  const FontSwitcher({
    super.key,
    required _FontSwitcherWidgetState state,
    required super.child,
  }) : _state = state;

  final _FontSwitcherWidgetState _state;

  void increase() => _state._increase();

  void decrease() => _state._decrease();

  static FontSwitcher? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FontSwitcher>();
  }

  @override
  bool updateShouldNotify(FontSwitcher oldWidget) => _state != oldWidget._state;
}

class FontSwitcherWidget extends StatefulWidget {
  const FontSwitcherWidget({
    super.key,
    required this.builder,
  });

  final WidgetBuilder builder;

  @override
  _FontSwitcherWidgetState createState() => _FontSwitcherWidgetState();
}

class _FontSwitcherWidgetState extends State<FontSwitcherWidget> {
  double textScaleFactorDelta = 0;

  void _increase() {
    setState(() {
      textScaleFactorDelta += 0.1;
    });
  }

  void _decrease() {
    setState(() {
      textScaleFactorDelta -= 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FontSwitcher(
      state: this,
      child: Builder(
        builder: (context) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor:
                MediaQuery.of(context).textScaleFactor + textScaleFactorDelta,
          ),
          child: widget.builder(context),
        ),
      ),
    );
  }
}
