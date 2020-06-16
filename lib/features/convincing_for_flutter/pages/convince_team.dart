import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';
import 'package:presentation/effects.dart';

class DesignersPage extends StatelessWidget {
  const DesignersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: const [
        ParallaxImage('assets/image35.jpg'),
        Center(
          child: ParallaxWidget(
            child: Text('Designers'),
          ),
        )
      ],
    );
  }
}

class UmphPage extends StatelessWidget {
  const UmphPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ImagePage(
      'assets/image39.jpg',
      child: Text(
        'Umph',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class LessTestingPage extends StatelessWidget {
  const LessTestingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: const [
        ParallaxImage('assets/image31.jpg'),
        Align(
          alignment: Alignment.topCenter,
          child: ParallaxWidget(
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Text('Less Testing'),
            ),
          ),
        ),
      ],
    );
  }
}

class DevelopersPage extends StatelessWidget {
  const DevelopersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ImagePage(
      'assets/image41.jpg',
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        'Developers',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class WorkshopPage extends StatelessWidget {
  const WorkshopPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          flex: 6,
          child: Center(
            child: ParallaxWidget(
              child: Text(
                'Prepare a Workshop',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: ParallaxWidget(child: Image.asset('assets/image44.jpg')),
        ),
      ],
    );
  }
}

class ManagersPage extends StatelessWidget {
  const ManagersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ImagePage(
      'assets/image40.jpg',
      alignment: AlignmentDirectional.topEnd,
      child: Text(
        'Managers',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class MergingPage extends StatelessWidget {
  const MergingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        const ParallaxImage('assets/image18.jpg'),
        Row(
          children: const [
            Expanded(
              flex: 6,
              child: SizedBox(),
            ),
            Expanded(
              flex: 4,
              child: ParallaxWidget(
                child: Text(
                  'Merging Teams',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
