import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/pages/intro.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';

class Convincing extends StatefulWidget {
  static const String title = 'Convincing your company to Flutter';
  static const String subtitle = '(Groupon)';

  @override
  ConvincingState createState() {
    return new ConvincingState();
  }
}

class ConvincingState extends State<Convincing> {
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
            ],
        body: new PageView(
          controller: controller,
          children: [
            TitlePage(),
            PopularityPage(),
          ],
        ),
      ),
    );
  }
}
