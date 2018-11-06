import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';
import 'package:flutter_presentations/shared/page_transformer.dart';

class ParallaxWidget extends StatelessWidget {
  final PageVisibility pageVisibility;
  final double translationFactor;
  final Widget child;

  const ParallaxWidget({
    Key key,
    this.pageVisibility,
    this.translationFactor = 100.0,
    @required this.child,
  }) : super(key: key);

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
