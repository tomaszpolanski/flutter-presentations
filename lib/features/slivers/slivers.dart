import 'package:flutter/material.dart';
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
import 'package:flutter_presentations/shared/presentation_controller.dart';

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
  PresentationController presentationController;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    presentationController = PresentationController(controller: controller);
  }

  @override
  void dispose() {
    presentationController.dispose();
    controller.dispose();
    super.dispose();
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
            new LoadsOfCode(controller: presentationController),
            new Definition(),
            new WhatIsSliver(),
            new SimpleDemo(controller: presentationController),
            new SliverTypesPage(controller: presentationController),
            new ImplementingHeader(controller: presentationController),
            new CheatSheet(controller: presentationController),
            new CustomMultiChildLayoutExample(),
            new DemoTime(),
            new Thanks(),
          ],
        ),
      ),
    );
  }
}
