import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/code_reuse/pages/thats_all.dart';
import 'package:flutter_presentations/flutter_presentations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/presentation.dart';

void main() {
  group('Presentation', () {
    setUp(() {
      WidgetsBinding.instance.renderView.configuration =
          const ViewConfiguration(size: Size(4000, 4000));
    });

    testWidgets('True Effort Reuse', (WidgetTester tester) async {
      await tester.pumpWidget(const TickerMode(
        enabled: false,
        child: FlutterPresentations(),
      ));

      await tester.pumpAndSettle();
      await tester.tap(find.text('True Effort Reuse'));
      await tester.pumpAndSettle();
      while (!tester.any(find.byType(ThatsAll))) {
        expect(find.byKey(const Key('presentation')), findsOneWidget);
        tester
            .widget<Presentation>(find.byType(Presentation))
            .presentationController
            .nextStep();
        await tester.pumpAndSettle();
      }
      expect(find.byType(ThatsAll), findsOneWidget);
    });

    testWidgets('Big Applications', (WidgetTester tester) async {
      await tester.pumpWidget(const TickerMode(
        enabled: false,
        child: FlutterPresentations(),
      ));

      await tester.pumpAndSettle();
      await tester.tap(find.text('Big Applications'));
      await tester.pumpAndSettle();
      while (!tester.any(find.byType(ThatsAll))) {
        expect(find.byKey(const Key('presentation')), findsOneWidget);
        tester
            .widget<Presentation>(find.byType(Presentation))
            .presentationController
            .nextStep();
        await tester.pumpAndSettle();
      }
      expect(find.byType(ThatsAll), findsOneWidget);
    });
  });
}
