import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:presentation/effects.dart';

class PuppyPage extends StatelessWidget {
  const PuppyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        const ParallaxImage('assets/image34.jpg'),
        Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(child: SizedBox()),
              Expanded(
                child: ParallaxWidget(
                  child: Text(
                    "It's Good to be Small",
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
    return Row(
      children: const [
        Expanded(
            child: Image(
          image: AssetImage('assets/image13.png'),
          height: 250,
        )),
        Expanded(
          child: ParallaxWidget(
            child: Text('Customer', style: GTheme.big),
          ),
        ),
      ],
    );
  }
}

class MerchantPage extends StatelessWidget {
  const MerchantPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Image(
            image: AssetImage('assets/image7.png'),
            height: 250,
          ),
        ),
        Expanded(
          child: ParallaxWidget(
            child: Text('Merchant', style: GTheme.big),
          ),
        )
      ],
    );
  }
}
