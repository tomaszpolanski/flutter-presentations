import 'package:flutter/material.dart';

class Jetpack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/jetpack.png'),
          SizedBox(width: 40),
          Text(
            'Compose',
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
