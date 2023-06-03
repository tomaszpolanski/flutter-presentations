import 'package:flutter/material.dart';
import 'package:talk_effort_reuse/src/images.dart';

class CI extends StatelessWidget {
  const CI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text('CI'),
          Expanded(
            child: Image.asset(
              Images.pipeline,
              package: Images.package,
            ),
          )
        ],
      ),
    );
  }
}
