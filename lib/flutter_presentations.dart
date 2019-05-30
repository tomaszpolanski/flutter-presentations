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
        title: Text('Presentations'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(Slivers.title),
            subtitle: Text(Slivers.subtitle),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Slivers())),
          ),
          ListTile(
            title: Text(Convincing.title),
            subtitle: Text(Convincing.subtitle),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Convincing())),
          ),
          ListTile(
            title: Text(CodeReuse.title),
            subtitle: Text(CodeReuse.subtitle),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => CodeReuse())),
          ),
          ListTile(
            title: Text(Testing.title),
            subtitle: Text(CodeReuse.subtitle),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const Testing())),
          ),
        ],
      ),
    );
  }
}
