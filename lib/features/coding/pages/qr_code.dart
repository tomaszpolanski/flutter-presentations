import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatelessWidget {
  const QrCode({
    @required this.child,
    Key key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        return Stack(
          alignment: Alignment.center,
          children: [
            QrImage(
              data: 'https://github.com/tomaszpolanski/flutter-presentations',
            ),
            SizedBox(
              height: c.biggest.shortestSide / 4.5,
              width: c.biggest.shortestSide / 4.5,
              child: child,
            ),
          ],
        );
      },
    );
  }
}
