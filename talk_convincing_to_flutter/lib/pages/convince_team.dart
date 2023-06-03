import 'package:flutter/material.dart';
import 'package:presentation/effects.dart';
import 'package:shared_pages/shared_pages.dart';
import 'package:talk_convincing_to_flutter/pages/images.dart';

class DesignersPage extends StatelessWidget {
  const DesignersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      fit: StackFit.expand,
      children: [
        ParallaxImage(
          'assets/image35.jpg',
          package: Images.package,
        ),
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
  const UmphPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImagePage(
      package: Images.package,
      'assets/image39.jpg',
      child: Text(
        'Umph',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class LessTestingPage extends StatelessWidget {
  const LessTestingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      fit: StackFit.expand,
      children: [
        ParallaxImage(
          'assets/image31.jpg',
          package: Images.package,
        ),
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
  const DevelopersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImagePage(
      'assets/image41.jpg',
      package: Images.package,
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        'Developers',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class WorkshopPage extends StatelessWidget {
  const WorkshopPage({super.key});

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
          child: ParallaxWidget(
              child: Image.asset(
            'assets/image44.jpg',
            package: Images.package,
          )),
        ),
      ],
    );
  }
}

class ManagersPage extends StatelessWidget {
  const ManagersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImagePage(
      'assets/image40.jpg',
      package: Images.package,
      alignment: AlignmentDirectional.topEnd,
      child: Text(
        'Managers',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class MergingPage extends StatelessWidget {
  const MergingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ParallaxImage(
          'assets/image18.jpg',
          package: Images.package,
        ),
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
