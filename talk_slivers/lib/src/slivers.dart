import 'package:flutter/material.dart';
import 'package:talk_slivers/src/pages/cheat_sheet.dart';
import 'package:talk_slivers/src/pages/code.dart';
import 'package:talk_slivers/src/pages/custom_multi_child_layout.dart';
import 'package:talk_slivers/src/pages/definition.dart';
import 'package:talk_slivers/src/pages/demo_button.dart';
import 'package:talk_slivers/src/pages/examples.dart';
import 'package:talk_slivers/src/pages/implementing_header.dart';
import 'package:talk_slivers/src/pages/thanks.dart';
import 'package:talk_slivers/src/pages/title.dart';
import 'package:talk_slivers/src/pages/types.dart';
import 'package:talk_slivers/src/pages/what_is_sliver.dart';
import 'package:presentation/presentation.dart';

class Slivers extends StatefulWidget {
  const Slivers({super.key});

  static const String title = 'Slivers!';
  static const String subtitle = '(not Silvers)';

  @override
  SliversState createState() {
    return SliversState();
  }
}

class SliversState extends State<Slivers> {
  late PageController controller;
  late PresentationController presentationController;

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
