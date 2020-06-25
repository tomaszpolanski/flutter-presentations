import 'package:flutter/material.dart';

class DeclarativeUi extends StatelessWidget {
  const DeclarativeUi({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style:
          Theme.of(context).textTheme.headline6.copyWith(color: Colors.black),
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
