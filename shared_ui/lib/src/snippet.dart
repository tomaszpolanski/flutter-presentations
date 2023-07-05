// ignore_for_file: unused_element

import 'package:flutter/material.dart';

enum Platform {
  windows,
  macos,
}

class Snippet extends StatelessWidget {
  const Snippet({
    super.key,
    this.platform = Platform.windows,
    required this.child,
    this.icon,
  });

  final Platform platform;
  final Widget child;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return switch (platform) {
      Platform.windows => _Windows(
          icon: icon,
          child: child,
        ),
      Platform.macos => _MacOs(child: child),
    };
  }
}

class _Windows extends StatelessWidget {
  const _Windows({
    super.key,
    required this.child,
    this.icon,
  });

  final Widget child;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final _icon = icon;
    return Material(
      elevation: 6,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 3,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 56),
              child: child,
            ),
            Positioned(
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (_icon != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: _icon,
                      ),
                    const Spacer(),
                    _WindowsButton(
                      child: Container(
                        width: 20,
                        height: 2,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(width: 12),
                    _WindowsButton(
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    _WindowsButton(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CustomPaint(
                          painter: _CrossDrawPaint(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                          child: Container(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WindowsButton extends StatelessWidget {
  const _WindowsButton({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: child,
    );
  }
}

class _CrossDrawPaint extends CustomPainter {
  const _CrossDrawPaint({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final crossBrush = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas
      ..drawLine(
        Offset(size.width, size.height),
        Offset(size.width - size.width, size.height - size.height),
        crossBrush,
      )
      ..drawLine(
        Offset(size.width - size.width, size.height),
        Offset(size.width, size.height - size.height),
        crossBrush,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _MacOs extends StatelessWidget {
  const _MacOs({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Stack(
          children: [
            child,
            const Positioned(
              right: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    _MacOsButton(
                      color: Color(0xffff5f57),
                    ),
                    SizedBox(width: 12),
                    _MacOsButton(
                      color: Color(0xfffebc2e),
                    ),
                    SizedBox(width: 12),
                    _MacOsButton(
                      color: Color(0xff27c840),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MacOsButton extends StatelessWidget {
  const _MacOsButton({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
