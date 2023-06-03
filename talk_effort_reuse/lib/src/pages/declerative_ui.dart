import 'package:flutter/material.dart';
import 'package:talk_effort_reuse/src/images.dart';

class DeclarativeUi extends StatelessWidget {
  const DeclarativeUi({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style:
          Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black),
      child: Center(
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                Image.asset(
                  Images.jetpack,
                  package: Images.package,
                  height: 300,
                ),
                const Text('Compose'),
              ],
            ),
            TableRow(
              children: [
                Transform.translate(
                  offset: const Offset(-22, 0),
                  child: Image.asset(
                    Images.swiftui,
                    package: Images.package,
                    height: 300,
                  ),
                ),
                const Text('SwiftUI'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
