import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';
import 'package:flutter_presentations/shared/page_transformer.dart';
import 'package:flutter_presentations/shared/presentation_page.dart';

class ParallaxWidget3 extends StatelessWidget {
  const ParallaxWidget3({
    Key key,
    this.pageVisibility,
    this.translationFactor = 100.0,
    @required this.child,
  }) : super(key: key);

  final PageVisibility pageVisibility;
  final double translationFactor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final pageVisibility = this.pageVisibility ?? ParallaxSettings.of(context);
    final double xTranslation = pageVisibility.pagePosition * translationFactor;
    return Opacity(
      opacity: pageVisibility.visibleFraction,
      child: Transform(
        alignment: FractionalOffset.topLeft,
        transform: Matrix4.translationValues(
          xTranslation,
          0.0,
          0.0,
        ),
        child: child,
      ),
    );
  }
}

class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget({
    Key key,
    this.translationFactor = 100.0,
    @required this.child,
  }) : super(key: key);

  final double translationFactor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final result = ScrollSettings.of(context);
    final resolver = PageVisibilityResolver(metrics: result);
    final index = PageViewSettings.of(context).index;
    final visibility = resolver.resolvePageVisibility(index);
    final double xTranslation = visibility.pagePosition * 100;
    return Opacity(
      opacity: visibility.visibleFraction,
      child: Transform(
        alignment: FractionalOffset.topLeft,
        transform: Matrix4.translationValues(xTranslation, 0.0, 0.0),
        child: child,
      ),
    );
  }
}

class ParallaxDecorationImage extends DecorationImage {
  ParallaxDecorationImage({
    PageVisibility pageVisibility,
    ImageProvider image,
  }) : super(
          image: image,
          fit: BoxFit.cover,
          alignment: Alignment(2 * pageVisibility.pagePosition, 0.0),
        );
}
