import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  const Bar({
    super.key,
    this.start,
    this.end,
  });

  final Color? start;
  final Color? end;

  @override
  Widget build(BuildContext context) {
    final settings = context.dependOnInheritedWidgetOfExactType()!;
    final deltaExtent = settings.maxExtent! - settings.minExtent!;

    // 0.0 -> Expanded
    // 1.0 -> Collapsed to toolbar
    final t =
        (1.0 - (settings.currentExtent! - settings.minExtent!) / deltaExtent)
            .clamp(0.0, 1.0);

    return Container(color: Color.lerp(start, end, t));
  }
}

class BarSettings extends InheritedWidget {
  const BarSettings({
    super.key,
    this.minExtent,
    this.maxExtent,
    this.currentExtent,
    required super.child,
  });

  final double? minExtent;
  final double? maxExtent;
  final double? currentExtent;

  @override
  bool updateShouldNotify(BarSettings oldWidget) {
    return true;
  }
}
