import 'package:flutter/material.dart';

class Definition extends StatelessWidget {
  const Definition({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              '“A small, thin, narrow piece of '
              'something cut or split off a larger piece”',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontStyle: FontStyle.italic),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'assets/google.png',
                  height: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
