import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/flutter_presentations.dart';
import 'package:flutter_presentations/shared/animation_mode.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Presentation test', () {
    setUp(() {
      WidgetsBinding.instance.renderView.configuration =
          ViewConfiguration(size: const Size(4000, 4000));
    });

    testWidgets('test', (WidgetTester tester) async {
      await tester.pumpWidget(const AnimationMode(
        enabled: false,
        child: const FlutterPresentations(),
      ));

      await tester.pumpAndSettle();
      await tester.tap(find.text('True Effort Reuse'));
      await tester.pumpAndSettle();
      for (int i = 0; i < 60; i++) {
        await tester.fling(
          find.byKey(Key('presentation')),
          Offset(-300, 0),
          300,
        );
        await tester.pumpAndSettle();
      }
    });
  });
}
