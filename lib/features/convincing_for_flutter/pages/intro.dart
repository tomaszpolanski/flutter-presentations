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
                  'Convincing your company to Flutter',
                  style: Theme.of(context).textTheme.display2.copyWith(
                      color: const Color(0xFF6AA84F),
                      fontWeight: FontWeight.bold),
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
              style: Theme.of(context)
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
                    'GROUPON',
                    style: new TextStyle(color: Colors.green),
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

class PopularityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/popularity.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
