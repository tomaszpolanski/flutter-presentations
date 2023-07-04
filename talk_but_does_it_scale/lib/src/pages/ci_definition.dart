import 'package:flutter/material.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:shared_ui/shared_ui.dart';

class ContinuousIntegrationDefinition extends StatelessWidget {
  const ContinuousIntegrationDefinition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInVisibility(
      visible: true,
      child: DefaultTextStyle.merge(
        style: const TextStyle(color: GTheme.flutter3),
        textAlign: TextAlign.center,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Continuous Integration (CI) is the practice'),
              Text('of merging all developers\' working copies to a'),
              Text('shared mainline several times a day.'),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 40, top: 50),
                  child: Text(
                    'Wikipedia',
                    style: TextStyle(color: GTheme.flutter2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
