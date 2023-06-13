import 'package:flutter/material.dart';

class Snippet extends StatelessWidget {
  const Snippet({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _Windows(child: child);
  }
}

class _Windows extends StatelessWidget {
  const _Windows({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          width: 2,
          color: Theme.of(context).disabledColor,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  _WindowsButton(
                    child: Container(
                      width: 20,
                      height: 2,
                      color: Theme.of(context).colorScheme.onBackground,
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
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          child,
        ],
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

class _MacOs extends StatelessWidget {
  const _MacOs({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _MacOsButton(
                  color: const Color(0xffff5f57),
                ),
                const SizedBox(width: 12),
                _MacOsButton(
                  color: const Color(0xfffebc2e),
                ),
                const SizedBox(width: 12),
                _MacOsButton(
                  color: const Color(0xff27c840),
                ),
              ],
            ),
          ),
          child,
        ],
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
