import 'package:flutter/material.dart';

class Jetpack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Image.asset('assets/jetpack.png'),
          Text(
            'Compose',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
