import 'package:flutter/material.dart';
import 'package:klar_l10n/klar_l10n.dart';

class {{name.pascalCase()}}ScreenContent extends StatelessWidget {
  const {{name.pascalCase()}}ScreenContent({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            tr(
              context,
              const TermKey('settings.title'),
            ),
          ),
        ),
        body: const SizedBox(),
      );
}
