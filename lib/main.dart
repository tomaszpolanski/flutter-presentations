import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/slivers/slivers.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;

import 'dart:io' show Platform;

void main() {
  //debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  MaterialPageRoute.debugEnableFadingRoutes = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Presentations'),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new Text(Slivers.title),
            subtitle: new Text(Slivers.subtitle),
            onTap: () => Navigator.of(context)
                .push(new MaterialPageRoute(builder: (_) => new Slivers())),
          ),
        ],
      ),
    );
  }
}
