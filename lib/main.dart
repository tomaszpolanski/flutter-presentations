import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/slivers/SliversPage.dart';

void main() => runApp(new MyApp());

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
  MyHomePage({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Presentations',
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new Text(SliversPage.title),
            subtitle: new Text(SliversPage.subtitle),
            onTap: () {
              Navigator
                  .of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return new SliversPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
