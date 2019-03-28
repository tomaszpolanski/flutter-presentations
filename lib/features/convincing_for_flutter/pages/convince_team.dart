import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';
import 'package:flutter_presentations/shared/slide_effects.dart';

class DesignersPage extends StatelessWidget {
  const DesignersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
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
    return ImagePage(
      'assets/image39.jpg',
      alignment: AlignmentDirectional.topCenter,
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
    final pageVisibility = ParallaxSettings.of(context);
    return SlideWidget(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/image31.jpg'),
            fit: BoxFit.cover,
            alignment: FractionalOffset(
              0.5 + (pageVisibility.pagePosition),
              0.5,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: ParallaxWidget(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text('Less Testing'),
            ),
          ),
        ),
      ),
    );
  }
}

class DevelopersPage extends StatelessWidget {
  const DevelopersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImagePage(
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
    final pageVisibility = ParallaxSettings.of(context);
    return SlideWidget(
      child: Row(
        children: <Widget>[
          Expanded(
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
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('assets/image44.jpg'),
                  fit: BoxFit.fitHeight,
                  alignment: FractionalOffset(
                    0.5 + (pageVisibility.pagePosition),
                    0.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ManagersPage extends StatelessWidget {
  const ManagersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImagePage(
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
    final pageVisibility = ParallaxSettings.of(context);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ParallaxImage('assets/image18.jpg'),
        Row(
          children: [
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
