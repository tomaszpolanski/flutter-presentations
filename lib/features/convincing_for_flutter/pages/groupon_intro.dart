import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';

class PuppyPage extends StatelessWidget {
  const PuppyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/image34.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: const [
          Expanded(child: SizedBox()),
          Expanded(child: Text('Good to be Small', style: GTheme.big, textAlign: TextAlign.right,))
        ],
      ),
    );
  }
}

class CustomerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: Image(image: AssetImage('assets/image13.png'), height: 100.0,)),
        Expanded(child: Text('Customer', style: GTheme.medium))
      ],
    );
  }
}


class MerchantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: Image(image: AssetImage('assets/image7.png'), height: 100.0,)),
        Expanded(child: Text('Merchant', style: GTheme.medium))
      ],
    );
  }
}


class VisionPage extends StatelessWidget {
  const VisionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/image20.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}