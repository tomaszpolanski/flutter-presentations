import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/code_reuse/examples/pages/sliver_fill_remaining.dart';

class Examples extends StatelessWidget {
  const Examples({Key key}) : super(key: key);

  static const String title = 'Widget examples';
  static const String subtitle = 'Samples for Layout Cheat Sheet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: ListView(
        children: [
          ListTile(
            title: const Text(SliverFillRemainingPage.title),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const _DoubleTapBack(
                  child: SliverFillRemainingPage(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DoubleTapBack extends StatelessWidget {
  const _DoubleTapBack({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.green,
      ),
      child: GestureDetector(
        onDoubleTap: () => Navigator.pop(context),
        child: child,
      ),
    );
  }
}
