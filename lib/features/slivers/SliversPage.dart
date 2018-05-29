import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/slivers/pages/CheatSheet.dart';
import 'package:flutter_presentations/features/slivers/pages/CustomMultiChildLayoutExample.dart';
import 'package:flutter_presentations/features/slivers/pages/Definition.dart';
import 'package:flutter_presentations/features/slivers/pages/DemoTime.dart';
import 'package:flutter_presentations/features/slivers/pages/ImplementingHeader.dart';
import 'package:flutter_presentations/features/slivers/pages/SimpleDemo.dart';
import 'package:flutter_presentations/features/slivers/pages/SliverTypesPage.dart';
import 'package:flutter_presentations/features/slivers/pages/Thanks.dart';
import 'package:flutter_presentations/features/slivers/pages/TitlePage.dart';
import 'package:flutter_presentations/features/slivers/pages/WhatIsSliver.dart';


class SliversPage extends StatelessWidget {
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
            new Definition(),
            new DemoTime("Demo Time!"),
            new SliverTypesPage(),
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
