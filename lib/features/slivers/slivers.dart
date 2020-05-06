import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/slivers/pages/cheat_sheet.dart';
import 'package:flutter_presentations/features/slivers/pages/code.dart';
import 'package:flutter_presentations/features/slivers/pages/custom_multi_child_layout.dart';
import 'package:flutter_presentations/features/slivers/pages/definition.dart';
import 'package:flutter_presentations/features/slivers/pages/demo_button.dart';
import 'package:flutter_presentations/features/slivers/pages/examples.dart';
import 'package:flutter_presentations/features/slivers/pages/implementing_header.dart';
import 'package:flutter_presentations/features/slivers/pages/thanks.dart';
import 'package:flutter_presentations/features/slivers/pages/title.dart';
import 'package:flutter_presentations/features/slivers/pages/types.dart';
import 'package:flutter_presentations/features/slivers/pages/what_is_sliver.dart';
import 'package:presentation/presentation.dart';

class Slivers extends StatefulWidget {
  const Slivers({Key key}) : super(key: key);

  static const String title = 'Slivers!';
  static const String subtitle = '(not Silvers)';

  @override
  SliversState createState() {
    return SliversState();
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
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
          ];
        },
        body: PageView(
          controller: controller,
          children: [
            const TitlePage(),
            LoadsOfCode(controller: presentationController),
            const Definition(),
            const WhatIsSliver(),
            SimpleDemo(controller: presentationController),
            SliverTypesPage(controller: presentationController),
            ImplementingHeader(controller: presentationController),
            CheatSheet(controller: presentationController),
            const CustomMultiChildLayoutExample(),
            const DemoTime(),
            const Thanks(),
          ],
        ),
      ),
    );
  }
}
