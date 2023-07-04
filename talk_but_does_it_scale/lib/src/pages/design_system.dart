import 'package:flutter/material.dart';
import 'package:shared_ui/shared_ui.dart';

class DesignSystems extends StatelessWidget {
  const DesignSystems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInVisibility(
      visible: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: Colors.primaries.map((color) {
              return Wrap(
                children: List.generate(
                  9,
                  (index) => _colorWidget(color, index),
                ),
              );
            }).toList(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Body Small',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                'Body Medium',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                'Headline Small',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Title Large',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _colorWidget(MaterialColor color, int index) {
    return Container(
      width: 30,
      height: 30,
      color: color[index * 100],
    );
  }
}
