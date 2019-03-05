import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/shared/page_transformer.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';
import 'package:flutter_presentations/shared/slide_effects.dart';

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
              child: ParallaxWidget(
                translationFactor: 150.0,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    color: Colors.white,
                    height: 8.0,
                    width: 100.0,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 7,
                child: Text(text,
                    style: GTheme.big.copyWith(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}

class ImagePage extends StatelessWidget {
  final String asset;
  final AlignmentGeometry alignment;
  final Widget child;

  const ImagePage(
    this.asset, {
    Key key,
    this.child,
    this.alignment = AlignmentDirectional.topCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageVisibility = ParallaxSettings.of(context);
    return SlideWidget(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: ParallaxDecorationImage(
                pageVisibility: pageVisibility,
                image: AssetImage(asset),
              ),
            ),
          ),
          child != null
              ? SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Align(
                      alignment: alignment,
                      child: ParallaxWidget(
                        pageVisibility: pageVisibility,
                        child: child,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
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
    assert(settings != null, 'Slide must have PresentationSettings ancestor');
    return GestureDetector(
      onTap: () {
        settings.controller.next();
      },
      child: Container(color: Colors.transparent, child: child),
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

class ParallaxSettings extends InheritedWidget {
  const ParallaxSettings({
    Key key,
    @required this.pageVisibility,
    this.enabled = true,
    @required Widget child,
  }) : super(key: key, child: child);

  final PageVisibility pageVisibility;
  final bool enabled;

  static PageVisibility of(BuildContext context) {
    final ParallaxSettings widget =
        context.inheritFromWidgetOfExactType(ParallaxSettings);
    return widget.enabled
        ? widget?.pageVisibility
        : PageVisibility(visibleFraction: 1, pagePosition: 1);
  }

  @override
  bool updateShouldNotify(ParallaxSettings oldWidget) =>
      pageVisibility != oldWidget.pageVisibility ||
      enabled == oldWidget.enabled;
}

class SummaryPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color background;

  const SummaryPage({
    Key key,
    this.title,
    this.subtitle,
    this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Container(
        color: background,
        padding: EdgeInsets.all(30.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: ParallaxWidget(
                    translationFactor: 150.0,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        color: Colors.white,
                        height: 8.0,
                        width: 100.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 7,
                    child: Text(title,
                        style: GTheme.big.copyWith(color: Colors.white))),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(subtitle,
                  textAlign: TextAlign.end,
                  style: GTheme.big.copyWith(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
