import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeclarativeUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.title.copyWith(color: Colors.black),
      child: Center(
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                Image.asset(
                  'assets/jetpack.png',
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
                    'assets/swiftui.png',
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
