import 'package:flutter/material.dart';
import 'package:shared_ui/shared_ui.dart';

class BigIntro extends StatelessWidget {
  const BigIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 30),
            child: _Title(),
          ),
        ),
        Expanded(child: FlutterProjects()),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: Theme.of(context).textTheme.headlineSmall,
        children: <InlineSpan>[
          const TextSpan(text: 'Large '),
          WidgetSpan(
            child: Image.asset(
              'assets/image4.png',
              height: 130,
            ),
          ),
          const TextSpan(text: 'Applications'),
        ],
      ),
    );
  }
}
