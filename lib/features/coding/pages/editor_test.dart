import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:flutter_presentations/features/coding/pages/editor.dart';

class EditorTest extends StatefulWidget {
  @override
  _EditorTestState createState() => _EditorTestState();
}

class _EditorTestState extends State<EditorTest> {
  Brightness _brightness = Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _brightness = _brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark;
        });
      },
      child: Editor(test, brightness: _brightness),
    );
  }
}

const test = '''
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
              version: QrVersions.auto,
              gapless: true,
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
''';
