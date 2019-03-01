import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';
import 'package:flutter_presentations/shared/slide_effects.dart';

class PuppyPage extends StatelessWidget {
  const PuppyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageVisibility = ParallaxSettings.of(context);
    return SlideWidget(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/image34.jpg'),
            fit: BoxFit.none,
            alignment: FractionalOffset(
              0.5 + (pageVisibility.pagePosition),
              0.5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(child: SizedBox()),
              Expanded(
                child: Text(
                  'It\'s Good to be Small',
                  style: GTheme.big,
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        ),
      ),
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
            height: 200.0,
          )),
          Expanded(
            child: ParallaxWidget(
              child: Text('Customer', style: GTheme.medium),
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
              height: 200.0,
            ),
          ),
          Expanded(
            child: ParallaxWidget(
              child: Text('Merchant', style: GTheme.medium),
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
    return SlideWidget(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/image20.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
