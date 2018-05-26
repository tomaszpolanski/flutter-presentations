import 'package:flutter/material.dart';

class Thanks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        new Center(
          child: new Text(
            "Thank you!",
            style: Theme.of(context).textTheme.display3.copyWith(
                color: const Color(0xFF6AA84F), fontWeight: FontWeight.bold),
          ),
        ),
        new Align(
          alignment: Alignment.bottomRight,
          child: new Padding(
            padding: const EdgeInsets.only(right: 18.0, bottom: 18.0),
            child: new Text(
              '@tpolansk',
              style: Theme
                  .of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.blueAccent, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
