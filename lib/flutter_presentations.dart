import 'package:flutter/material.dart';
import 'package:flutter_presentations/shared/shortcuts.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:talk_big_applications/talk_big_applications.dart';
import 'package:talk_but_does_it_scale/talk_but_does_it_scale.dart';
import 'package:talk_convincing_to_flutter/talk_convincing_to_flutter.dart';
import 'package:talk_effort_reuse/talk_effort_reuse.dart';
import 'package:talk_refactoring/talk_refactoring.dart';
import 'package:talk_slivers/talk_slivers.dart';

class FlutterPresentations extends StatelessWidget {
  const FlutterPresentations({super.key});

  static final GlobalKey<NavigatorState> gKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcherWidget(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: gKey,
          theme: ThemeSwitcher.maybeOf(context)?.date,
          builder: (context, child) => PresentationShortcuts(
            navigator: () => gKey.currentState,
            child: child!,
          ),
          home: const _PresentationList(),
        );
      },
    );
  }
}

class _PresentationList extends StatelessWidget {
  const _PresentationList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Theme(
        data: theme.copyWith(
          listTileTheme: ListTileThemeData(
            tileColor: theme.colorScheme.background,
            textColor: theme.colorScheme.onBackground,
            iconColor: theme.colorScheme.onBackground,
            titleTextStyle: const TextStyle(fontSize: 30),
            subtitleTextStyle: const TextStyle(fontSize: 20),
          ),
        ),
        child: ListView(
          children: [
            ListTile(
              title: const Text(ButDoesItScale.title),
              subtitle: const Text(ButDoesItScale.subtitle),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const ButDoesItScale(),
                ),
              ),
            ),
            ListTile(
              title: const Text(Refactoring.title),
              subtitle: const Text(Refactoring.subtitle),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const Refactoring(),
                ),
              ),
            ),
            ListTile(
              title: const Text(BigApplications.title),
              subtitle: const Text(BigApplications.subtitle),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const BigApplications(),
                ),
              ),
            ),
            ListTile(
              title: const Text(Slivers.title),
              subtitle: const Text(Slivers.subtitle),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (_) => const Slivers()),
              ),
            ),
            ListTile(
              title: const Text(Convincing.title),
              subtitle: const Text(Convincing.subtitle),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (_) => const Convincing()),
              ),
            ),
            ListTile(
              title: const Text(CodeReuse.title),
              subtitle: const Text(CodeReuse.subtitle),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (_) => const CodeReuse()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
