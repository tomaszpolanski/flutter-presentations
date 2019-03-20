import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/code_reuse/groupon_merchant.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/convincing.dart';
import 'package:flutter_presentations/features/slivers/slivers.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final GlobalKey gKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        cardColor: Colors.white,
      ),
      navigatorKey: gKey,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

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
        ],
      ),
    );
  }
}
