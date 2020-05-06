import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({Key key}) : super(key: key);
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
                  style: Theme.of(context).textTheme.headline2.copyWith(
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
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          '🚫',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                    Text(
                      '(not Silvers...)',
                      style: Theme.of(context).textTheme.bodyText2,
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
                  .headline6
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
