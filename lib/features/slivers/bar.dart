import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  const Bar({
    Key key,
    this.start,
    this.end,
  }) : super(key: key);

  final Color start;
  final Color end;

  @override
  Widget build(BuildContext context) {
    final BarSettings settings = context.dependOnInheritedWidgetOfExactType();
    assert(settings != null,
        'A Bar must be wrapped in the widget returned by Bar.createSettings().');

    final double deltaExtent = settings.maxExtent - settings.minExtent;

    // 0.0 -> Expanded
    // 1.0 -> Collapsed to toolbar
    final double t =
        (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent)
            .clamp(0.0, 1.0);

    return Container(color: Color.lerp(start, end, t));
  }
}

class BarSettings extends InheritedWidget {
  const BarSettings({
    Key key,
    this.minExtent,
    this.maxExtent,
    this.currentExtent,
    Widget child,
  }) : super(key: key, child: child);

  final double minExtent;
  final double maxExtent;
  final double currentExtent;

  @override
  bool updateShouldNotify(BarSettings oldWidget) {
    return true;
  }
}
