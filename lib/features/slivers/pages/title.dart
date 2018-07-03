import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        new Align(
          alignment: Alignment.centerLeft,
          child: new Padding(
            padding: const EdgeInsets.only(left: 80.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'Slivers!',
                  style: Theme.of(context).textTheme.display3.copyWith(
                      color: const Color(0xFF6AA84F),
                      fontWeight: FontWeight.bold),
                ),
                new Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    new Stack(
                      children: [
                        new Text(
                          '🥄',
                          style: Theme.of(context).textTheme.display1,
                        ),
                        new Text(
                          '🚫',
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ],
                    ),
                    new Text(
                      '(not Silvers...)',
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        new Align(
          alignment: Alignment.bottomRight,
          child: new Padding(
            padding: const EdgeInsets.only(right: 18.0, bottom: 18.0),
            child: new DefaultTextStyle(
              style: Theme
                  .of(context)
                  .textTheme
                  .title
                  .copyWith(fontWeight: FontWeight.bold),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Text(
                    'Tomek Polański',
                    style: new TextStyle(color: Colors.black),
                  ),
                  new Text(
                    '@tpolansk',
                    style: new TextStyle(color: Colors.blueAccent),
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
