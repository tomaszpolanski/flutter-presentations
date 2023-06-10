import 'package:flutter/material.dart';
import 'package:shared_theme/src/themes.dart';

class ThemeSwitcher extends InheritedWidget {
  const ThemeSwitcher({
    super.key,
    required _ThemeSwitcherWidgetState state,
    required super.child,
  }) : _state = state;

  final _ThemeSwitcherWidgetState _state;

  ThemeData get date => _state._themeData;

  set date(ThemeData data) {
    _state._toggle();
  }

  static ThemeSwitcher? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeSwitcher>();
  }

  @override
  bool updateShouldNotify(ThemeSwitcher oldWidget) =>
      _state != oldWidget._state;
}

class ThemeSwitcherWidget extends StatefulWidget {
  const ThemeSwitcherWidget({
    super.key,
    required this.builder,
  });

  final WidgetBuilder builder;

  @override
  _ThemeSwitcherWidgetState createState() => _ThemeSwitcherWidgetState();
}

class _ThemeSwitcherWidgetState extends State<ThemeSwitcherWidget> {
  bool _isLight = true;
  late ThemeData _themeData = _theme;

  void _toggle() {
    setState(() {
      _isLight = !_isLight;
      _themeData = _theme;
    });
  }

  ThemeData get _theme => _isLight ? blueLight() : blueDark();

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher(
      state: this,
      child: Builder(
        builder: (context) => widget.builder(context),
      ),
    );
  }
}
