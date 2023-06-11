import 'package:flutter/material.dart';
import 'package:shared_ui/shared_ui.dart';

class FadeInVisibility extends StatelessWidget {
  const FadeInVisibility({
    super.key,
    required this.child,
    required this.visible,
  });

  final bool visible;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return visible
        ? FadeInWidget(child: child)
        : Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: false,
            child: child,
          );
  }
}
