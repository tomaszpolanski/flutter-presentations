import 'package:flutter/material.dart';

class Definition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Padding(
        padding: const EdgeInsets.all(18.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Text(
              "“A small, thin, narrow piece of "
                  "something cut or split off a larger piece”",
              style: Theme
                  .of(context)
                  .textTheme
                  .display1
                  .copyWith(fontStyle: FontStyle.italic),
            ),
            new Align(
              alignment: Alignment.centerRight,
              child: new Image.asset('assets/google.png',
              height: 40.0,),
            ),
          ],
        ),
      ),
    );
  }
}
