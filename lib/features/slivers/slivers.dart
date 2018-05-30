import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/slivers/pages/CustomMultiChildLayoutExample.dart';
import 'package:flutter_presentations/features/slivers/pages/cheat_sheet.dart';
import 'package:flutter_presentations/features/slivers/pages/definition.dart';
import 'package:flutter_presentations/features/slivers/pages/demo_button.dart';
import 'package:flutter_presentations/features/slivers/pages/examples.dart';
import 'package:flutter_presentations/features/slivers/pages/implementing_header.dart';
import 'package:flutter_presentations/features/slivers/pages/thanks.dart';
import 'package:flutter_presentations/features/slivers/pages/title.dart';
import 'package:flutter_presentations/features/slivers/pages/types.dart';
import 'package:flutter_presentations/features/slivers/pages/what_is_sliver.dart';

class Slivers extends StatelessWidget {
  static final String title = 'Slivers!';
  static final String subtitle = '(not Silvers)';

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        body: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
            ];
          },
          body: new PageView(children: [
            new TitlePage(),
            new WhatIsSliver(),
            new SliverTypesPage(),
            new Definition(),
            new DemoTime("Demo Time!"),
            new SimpleDemo(),
            new ImplementingHeader(),
            new CheatSheet(),
            new CustomMultiChildLayoutExample(),
            new DemoTime("Advance Demo Time!"),
            new Thanks(),
          ]),
        ),
      ),
    );
  }
}
