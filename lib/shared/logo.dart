import 'package:flutter/material.dart';

class PresentationLogo extends StatelessWidget {
  const PresentationLogo({
    super.key,
    required this.controller,
    required this.child,
  });

  final PageController controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final page = controller.page ?? 0.0;
        return Logo(
          visible: (page * 1000).floor() % 1000 == 0,
          child: child,
        );
      },
    );
  }
}

class Logo extends StatefulWidget {
  const Logo({
    super.key,
    required this.child,
    this.visible = true,
  });

  final Widget child;
  final bool visible;

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      value: widget.visible ? 1 : 0,
      duration: const Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(Logo oldWidget) {
    if (oldWidget.visible != widget.visible) {
      if (widget.visible) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller.drive(CurveTween(curve: Curves.easeInQuint)),
      child: widget.child,
    );
  }
}
