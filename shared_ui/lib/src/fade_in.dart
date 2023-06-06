import 'package:flutter/material.dart';

/// Performers fade in transition whenever the widget is displayed.
///
/// This should be used when you make a large widget to appear, like changing
/// from page's loading animation to full content.
class FadeInWidget extends StatefulWidget {
  const FadeInWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.onDone,
  });

  final Widget child;
  final Duration duration;
  final VoidCallback? onDone;

  @override
  _FadeInWidgetState createState() => _FadeInWidgetState();
}

class _FadeInWidgetState extends State<FadeInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _controller.addStatusListener(_animationStatusChange);
  }

  @override
  void didChangeDependencies() {
    _controller.forward();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller
      ..removeStatusListener(_animationStatusChange)
      ..dispose();
    super.dispose();
  }

  void _animationStatusChange(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      widget.onDone?.call();
    }
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
        opacity: _controller.drive(CurveTween(curve: Curves.easeIn)),
        child: widget.child,
      );
}
