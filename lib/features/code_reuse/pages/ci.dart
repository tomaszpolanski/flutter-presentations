import 'package:flutter/material.dart';

class CI extends StatelessWidget {
  const CI({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text('CI'),
          Expanded(
            child: Image.asset('assets/pipeline.png'),
          )
        ],
      ),
    );
  }
}
