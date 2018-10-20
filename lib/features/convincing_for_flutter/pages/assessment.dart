import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';

class SurveyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/image19.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
          alignment: Alignment.bottomLeft,
          child: Text('Survey', style: TextStyle(color: Colors.black))),
    );
  }
}

class CriteriaPage extends StatefulWidget {
  @override
  CriteriaPageState createState() {
    return new CriteriaPageState();
  }
}

class CriteriaPageState extends State<CriteriaPage>
    with TickerProviderStateMixin {
  AnimationController _techController;

  @override
  void initState() {
    super.initState();
    _techController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _techController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _techController.forward();
      },
      child: Container(
        color: GTheme.green,
        child: Center(
            child: Stack(
          children: [
            Transform.rotate(
              origin: Offset(0.0, 50.0),
              angle: (2 * pi / 3) * _techController.value,
              child: Container(
                width: 4.0,
                height: 100.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            Container(
              width: 4.0,
              height: 100.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            Transform.rotate(
              origin: Offset(0.0, 50.0),
              angle: -2 * pi / 3,
              child: Container(
                width: 4.0,
                height: 100.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class DevDesignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Center(
              child: Text(
            'Design by Dev',
            textAlign: TextAlign.center,
          )),
        ),
        Expanded(
          flex: 6,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/image17.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class GrouponPlus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: GTheme.teal,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Center(
              child: Text(
                'Groupon+',
                textAlign: TextAlign.center,
                style: GTheme.medium.copyWith(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Image(image: AssetImage('assets/image21.png')),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 4,
            child: Image(image: AssetImage('assets/image16.png')),
          ),
        ],
      ),
    );
  }
}

class AppiumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/image37.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}

class IntegrationTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Integrations Tests',
            textAlign: TextAlign.center,
            style: GTheme.medium,
          ),
        ),
        Center(
          child: Container(
            height: 200.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: const [
                Expanded(child: Image(image: AssetImage('assets/image28.png'))),
                Expanded(child: Image(image: AssetImage('assets/image26.png'))),
                Expanded(child: Image(image: AssetImage('assets/image29.png'))),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class WidgetTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/image23.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Text(
            'Widget tests to the rescue!',
            style: GTheme.medium.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class LearningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/image43.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Text(
            'Learning',
            style: GTheme.big.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class FlutterDartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Flutter vs Dart',
            textAlign: TextAlign.center,
            style: GTheme.big,
          ),
        ),
        Center(
          child: Container(
            height: 200.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: const [
                Expanded(child: Image(image: AssetImage('assets/image4.png'))),
                Expanded(child: Image(image: AssetImage('assets/image25.png'))),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class TeachingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/image45.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Text(
            'Teaching',
            style: GTheme.big.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class LaunchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Text(
                  'The Launch',
                  style: GTheme.big.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('assets/image42.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
