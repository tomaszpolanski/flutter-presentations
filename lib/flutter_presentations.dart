import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/code_reuse/true_code_reuse.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/convincing.dart';
import 'package:flutter_presentations/features/slivers/slivers.dart';
import 'package:flutter_presentations/features/testing/testing.dart';

class FlutterPresentations extends StatelessWidget {
  const FlutterPresentations({Key key}) : super(key: key);

  static final GlobalKey gKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: gKey,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: const _PresentationList(),
    );
  }
}

class _PresentationList extends StatelessWidget {
  const _PresentationList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presentations'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text(Slivers.title),
            subtitle: const Text(Slivers.subtitle),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Slivers())),
          ),
          ListTile(
            title: const Text(Convincing.title),
            subtitle: const Text(Convincing.subtitle),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Convincing())),
          ),
          ListTile(
            title: const Text(CodeReuse.title),
            subtitle: const Text(CodeReuse.subtitle),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const CodeReuse())),
          ),
          ListTile(
            title: const Text(Testing.title),
            subtitle: const Text(CodeReuse.subtitle),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const Testing())),
          ),
        ],
      ),
    );
  }
}
