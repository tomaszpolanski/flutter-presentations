import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Slivers!',
                  style: Theme.of(context).textTheme.display3.copyWith(
                      color: const Color(0xFF6AA84F),
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Stack(
                      children: [
                        Text(
                          '🥄',
                          style: Theme.of(context).textTheme.display1,
                        ),
                        Text(
                          '🚫',
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ],
                    ),
                    Text(
                      '(not Silvers...)',
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 18, bottom: 18),
            child: DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontWeight: FontWeight.bold),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'Tomek Polański',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    '@tpolansk',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
