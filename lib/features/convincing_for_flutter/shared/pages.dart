import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';

class SectionPage extends StatelessWidget {
  final String text;

  const SectionPage(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Container(
        color: GTheme.green,
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  color: Colors.white,
                  height: 8.0,
                  width: 100.0,
                ),
              ),
            ),
            Expanded(
                flex: 7,
                child:
                    Text(text, style: GTheme.big.copyWith(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}

class ImagePage extends StatelessWidget {
  final String asset;

  const ImagePage(this.asset, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(asset),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class SlideWidget extends StatelessWidget {
  final Widget child;

  const SlideWidget({Key key, this.child}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final PresentationSettings settings =
    context.inheritFromWidgetOfExactType(PresentationSettings);
    assert(settings != null,
    'Slide must have PresentationSettings ancestor');
    return GestureDetector(
      onTap: () {
        settings.controller.next();
      },
      child: child,
    );
  }
}


class PresentationSettings extends InheritedWidget {
  final PresentationController controller;

  const PresentationSettings({
    Key key,
    this.controller,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
