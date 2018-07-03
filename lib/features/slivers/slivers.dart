import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_presentations/features/slivers/pages/CustomMultiChildLayoutExample.dart';
import 'package:flutter_presentations/features/slivers/pages/cheat_sheet.dart';
import 'package:flutter_presentations/features/slivers/pages/code.dart';
import 'package:flutter_presentations/features/slivers/pages/definition.dart';
import 'package:flutter_presentations/features/slivers/pages/demo_button.dart';
import 'package:flutter_presentations/features/slivers/pages/examples.dart';
import 'package:flutter_presentations/features/slivers/pages/implementing_header.dart';
import 'package:flutter_presentations/features/slivers/pages/thanks.dart';
import 'package:flutter_presentations/features/slivers/pages/title.dart';
import 'package:flutter_presentations/features/slivers/pages/types.dart';
import 'package:flutter_presentations/features/slivers/pages/what_is_sliver.dart';

class Slivers extends StatefulWidget {
  static const String title = 'Slivers!';
  static const String subtitle = '(not Silvers)';

  @override
  SliversState createState() {
    return new SliversState();
  }
}

class SliversState extends State<Slivers> {
  PageController controller;
  final RawKeyboard _keyboard = RawKeyboard.instance;

  @override
  void initState() {
    super.initState();
    controller = new PageController();
    _keyboard.addListener(_handleKey);
  }

  @override
  void dispose() {
    _keyboard.removeListener(_handleKey);
    controller.dispose();
    super.dispose();
  }

  void _handleKey(RawKeyEvent value) {
    print(controller.page);
    if (value is RawKeyUpEvent) {
      if (value.data is RawKeyEventDataAndroid) {
        final RawKeyEventDataAndroid data = value.data;
        switch (data.keyCode) {
          case 21:
            _previous();
            break;
          case 22:
            _next();
            break;
          default:
            break;
        }
      }
    }
  }

  void _previous() {
    controller.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _next() {
    controller.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
          ];
        },
        body: new PageView(
          controller: controller,
          children: [
            new TitlePage(),
            new LoadsOfCode(onNext: _next),
            new Definition(),
            new WhatIsSliver(),
            new SimpleDemo(),
            new SliverTypesPage(),
            new ImplementingHeader(),
            new CheatSheet(onNext: _next),
            new CustomMultiChildLayoutExample(),
            new DemoTime(),
            new Thanks(),
          ],
        ),
      ),
    );
  }
}
