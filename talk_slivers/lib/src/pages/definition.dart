import 'package:flutter/material.dart';
import 'package:talk_slivers/src/images.dart';

class Definition extends StatelessWidget {
  const Definition({super.key});
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
                  .headlineMedium!
                  .copyWith(fontStyle: FontStyle.italic),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  Images.google,
                  package: Images.package,
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
