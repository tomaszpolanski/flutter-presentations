import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/code_reuse/examples/examples.dart';
import 'package:flutter_presentations/features/code_reuse/true_code_reuse.dart';
import 'package:flutter_presentations/features/coding/coding.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/convincing.dart';
import 'package:flutter_presentations/features/slivers/slivers.dart';
import 'package:flutter_presentations/features/testing/testing.dart';
import 'package:flutter_presentations/shared/shortcuts.dart';
import 'package:talk_big_applications/talk_big_applications.dart';
import 'package:talk_but_does_it_scale/talk_but_does_it_scale.dart';
import 'package:talk_refactoring/talk_refactoring.dart';

class FlutterPresentations extends StatelessWidget {
  const FlutterPresentations({super.key});

  static final GlobalKey<NavigatorState> gKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: gKey,
      theme: ThemeData(fontFamily: 'Montserrat'),
      builder: (context, child) => PresentationShortcuts(
        navigator: () => gKey.currentState,
        child: child!,
      ),
      home: const _PresentationList(),
    );
  }
}

class _PresentationList extends StatelessWidget {
  const _PresentationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presentations'),
      ),
      body: ListView(
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
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (_) => const Slivers())),
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
          ListTile(
            title: const Text(Testing.title),
            subtitle: const Text(CodeReuse.subtitle),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (_) => const Testing())),
          ),
          ListTile(
            title: const Text(Coding.title),
            subtitle: const Text(Coding.subtitle),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (_) => const Coding())),
          ),
          ListTile(
            title: const Text(Examples.title),
            subtitle: const Text(Examples.subtitle),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const Examples()),
            ),
          ),
        ],
      ),
    );
  }
}
