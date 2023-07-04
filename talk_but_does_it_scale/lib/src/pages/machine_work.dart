import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_pages/shared_pages.dart';

class WorkForMachine extends StatefulWidget {
  const WorkForMachine({
    super.key,
  });

  @override
  State<WorkForMachine> createState() => _WorkForMachineState();
}

class _WorkForMachineState extends State<WorkForMachine> {
  bool _showHuman = true;
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    _subscription = Stream.periodic(const Duration(seconds: 3)).listen((_) {
      if (mounted) {
        setState(() => _showHuman = !_showHuman);
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TitledPage(
      title: const Text("Don't let human do machine's work"),
      child: Center(
        child: AnimatedCrossFade(
          duration: const Duration(milliseconds: 500),
          firstChild: const _BigEmoji(emoji: '🧍'),
          secondChild: const _BigEmoji(emoji: '🤖'),
          crossFadeState:
              _showHuman ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ),
    );
  }
}

class _BigEmoji extends StatelessWidget {
  const _BigEmoji({
    super.key,
    required this.emoji,
  });

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: Transform.scale(
        scale: 4,
        child: Center(
          child: Text(emoji),
        ),
      ),
    );
  }
}
