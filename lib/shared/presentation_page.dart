import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';
import 'package:flutter_presentations/shared/page_transformer.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';

class Presentation extends StatelessWidget {
  const Presentation({
    Key key,
    @required this.pageCreator,
    @required this.controller,
    @required this.presentationController,
    this.enableParallax = true,
  }) : super(key: key);

  final List<ValueGetter<Widget>> pageCreator;
  final PageController controller;
  final PresentationController presentationController;
  final bool enableParallax;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
            ],
        body: PresentationSettings(
          controller: presentationController,
          child: DefaultTextStyle.merge(
            style: GTheme.big,
            child: PageTransformer(
              enableParallax: enableParallax,
              pageViewBuilder: (context, visibilityResolver) {
                return PageView.builder(
                  controller: controller,
                  itemCount: pageCreator.length,
                  itemBuilder: (context, index) {
                    final pageVisibility =
                        visibilityResolver.resolvePageVisibility(index);
                    return ParallaxSettings(
                      enabled: enableParallax,
                      pageVisibility: pageVisibility,
                      child: pageCreator[index](),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class PresentationPage extends StatelessWidget {
  const PresentationPage({Key key, this.title, this.child}) : super(key: key);

  final Widget title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: DefaultTextStyle(
          style: Theme.of(context).textTheme.display1.copyWith(
              color: const Color(0xFF6AA84F), fontWeight: FontWeight.bold),
          child: title,
        ),
      ),
      body: child,
    );
  }
}
