import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sidekick/flutter_sidekick.dart';

class Reusage extends StatefulWidget {
  @override
  _ReusageState createState() => _ReusageState();
}

class _ReusageState extends State<Reusage> with SingleTickerProviderStateMixin {
  bool _show = false;
  Offset offset;
  SidekickController controller;

  @override
  void initState() {
    super.initState();
    controller = SidekickController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Container(
              width: 480,
              margin: EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Container(
                color: Colors.pink,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: GestureDetector(
                            onTap: () => controller.moveToTarget(context),
                            child: Stack(
                              children: <Widget>[
                                Sidekick(
                                  tag: 'source1',
                                  targetTag: 'target1',
                                  animationBuilder: (animation) =>
                                      CurvedAnimation(
                                        parent: animation,
                                        curve: FlippedCurve(Curves.easeOut),
                                      ),
                                  child: controller.status !=
                                          AnimationStatus.completed
                                      ? Icon(Icons.image)
                                      : SizedBox(),
                                ),
                                Sidekick(
                                  tag: 'source2',
                                  targetTag: 'target2',
                                  child: Icon(Icons.image),
                                ),
                                Icon(Icons.image),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Sidekick(
                        tag: 'target1',
                        flightShuttleBuilder: (
                          BuildContext flightContext,
                          Animation<double> animation,
                          SidekickFlightDirection flightDirection,
                          BuildContext fromSidekickContext,
                          BuildContext toSidekickContext,
                        ) =>
                            Icon(Icons.image),
                        child: controller.status == AnimationStatus.forward ||
                                controller.status == AnimationStatus.dismissed
                            ? SizedBox()
                            : Icon(Icons.image),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Sidekick(
                        tag: 'target2',
                        flightShuttleBuilder: (
                          BuildContext flightContext,
                          Animation<double> animation,
                          SidekickFlightDirection flightDirection,
                          BuildContext fromSidekickContext,
                          BuildContext toSidekickContext,
                        ) =>
                            Icon(Icons.image),
                        child: controller.status == AnimationStatus.forward ||
                                controller.status == AnimationStatus.dismissed
                            ? SizedBox()
                            : Icon(Icons.image),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: Image(
          image: AssetImage('assets/image32.png'),
          height: 250,
        )),
      ],
    );
  }
}
