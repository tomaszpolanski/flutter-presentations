import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';
import 'package:flutter_presentations/shared/page_transformer.dart';
import 'package:flutter_presentations/shared/presentation_page.dart';
import 'package:flutter_presentations/shared/slide_effects.dart';

class PuppyPage extends StatelessWidget {
  const PuppyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ParallaxImage('assets/image34.jpg'),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(child: SizedBox()),
              Expanded(
                child: ParallaxWidget(
                  child: Text(
                    'It\'s Good to be Small',
                    style: GTheme.big,
                    textAlign: TextAlign.right,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CustomerPage extends StatelessWidget {
  const CustomerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Row(
        children: const [
          Expanded(
              child: Image(
            image: AssetImage('assets/image13.png'),
            height: 250.0,
          )),
          Expanded(
            child: ParallaxWidget(
              child: Text('Customer', style: GTheme.big),
            ),
          ),
        ],
      ),
    );
  }
}

class MerchantPage extends StatelessWidget {
  const MerchantPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Row(
        children: const [
          Expanded(
            child: Image(
              image: AssetImage('assets/image7.png'),
              height: 250.0,
            ),
          ),
          Expanded(
            child: ParallaxWidget(
              child: Text('Merchant', style: GTheme.big),
            ),
          )
        ],
      ),
    );
  }
}

class VisionPage extends StatelessWidget {
  const VisionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final result = ScrollSettings.of(context);
    final resolver = PageVisibilityResolver(metrics: result);
    final index = PageViewSettings.of(context).index;
    final visibility = resolver.resolvePageVisibility(index);
    print('QQQ ${visibility.pagePosition}');
    return Image.asset(
      'assets/image21.png',
      fit: BoxFit.cover,
//      alignment: Alignment(
//        0.5 + (visibility.pagePosition),
//        0.5,
//      ),
    );
  }
}
