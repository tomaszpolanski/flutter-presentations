import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_presentations/features/code_reuse/true_code_reuse.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/convincing.dart';
import 'package:flutter_presentations/features/slivers/slivers.dart';
import 'package:flutter_presentations/shared/animation_mode.dart';

void main() {
  debugProfileBuildsEnabled = true;
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  enableFlutterDriverExtension();
  runApp(AnimationMode(
    enabled: true,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  static final GlobalKey gKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: gKey,
      theme: ThemeData(fontFamily: 'Montserrat'),
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
        backgroundColor: Colors.red,
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
