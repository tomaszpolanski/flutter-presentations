import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/effects.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:talk_convincing_to_flutter/pages/images.dart';

class PuppyPage extends StatelessWidget {
  const PuppyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ParallaxImage(
          'assets/image34.jpg',
          package: Images.package,
        ),
        Padding(
          padding: EdgeInsets.all(18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Image.asset(
            'assets/image13.png',
            package: Images.package,
            height: 250,
          ),
        ),
        const Expanded(
          child: ParallaxWidget(
            child: Text('Customer', style: GTheme.big),
          ),
        ),
      ],
    );
  }
}

class MerchantPage extends StatelessWidget {
  const MerchantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Image.asset(
            'assets/image7.png',
            package: Images.package,
            height: 250,
          ),
        ),
        const Expanded(
          child: ParallaxWidget(
            child: Text('Merchant', style: GTheme.big),
          ),
        )
      ],
    );
  }
}
