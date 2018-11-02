import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';
import 'package:flutter_presentations/shared/page_transformer.dart';
import 'package:flutter_presentations/shared/slide_effects.dart';

class DesignersPage extends StatelessWidget {
  final PageVisibility pageVisibility;

  const DesignersPage({Key key, @required this.pageVisibility})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/image35.jpg'),
            fit: BoxFit.cover,
            alignment: FractionalOffset(
              0.5 + (pageVisibility.pagePosition),
              0.5,
            ),
          ),
        ),
        child: Center(
            child: ParallaxWidget(
          pageVisibility: pageVisibility,
          child: Text('Designers'),
        )),
      ),
    );
  }
}

class UmphPage extends StatelessWidget {
  final PageVisibility pageVisibility;

  const UmphPage({Key key, @required this.pageVisibility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImagePage(
      'assets/image39.jpg',
      pageVisibility: pageVisibility,
      alignment: AlignmentDirectional.topCenter,
      child: Text(
        'Umph',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class LessTestingPage extends StatelessWidget {
  final PageVisibility pageVisibility;

  const LessTestingPage({Key key, @required this.pageVisibility})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            pageVisibility: pageVisibility,
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
  final PageVisibility pageVisibility;

  const DevelopersPage({Key key, @required this.pageVisibility})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImagePage(
      'assets/image41.jpg',
      pageVisibility: pageVisibility,
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        'Developers',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class WorkshopPage extends StatelessWidget {
  final PageVisibility pageVisibility;

  const WorkshopPage({Key key, @required this.pageVisibility})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Center(
                child: ParallaxWidget(
              pageVisibility: pageVisibility,
              child: Text(
                'Prepare a Workshop',
                textAlign: TextAlign.center,
              ),
            )),
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
  final PageVisibility pageVisibility;

  const ManagersPage({Key key, @required this.pageVisibility})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImagePage(
      'assets/image40.jpg',
      pageVisibility: pageVisibility,
      alignment: AlignmentDirectional.topEnd,
      child: Text(
        'Managers',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class MergingPage extends StatelessWidget {
  final PageVisibility pageVisibility;

  const MergingPage({Key key, @required this.pageVisibility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: ParallaxDecorationImage(
            pageVisibility: pageVisibility,
            image: AssetImage('assets/image18.jpg'),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: SizedBox(),
            ),
            Expanded(
              flex: 4,
              child: ParallaxWidget(
                pageVisibility: pageVisibility,
                child: Text(
                  'Merging Teams',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
