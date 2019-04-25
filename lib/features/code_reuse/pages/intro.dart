import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/parallax_effect.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/blueprint.jpg'),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: const [
              Colors.white,
              Colors.white,
              Colors.transparent,
              Colors.transparent,
            ],
            stops: const [0, 0.3, 0.9, 1],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: DefaultTextStyle.merge(
                  style: Theme.of(context).textTheme.headline,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new RichText(
                        text: new TextSpan(
                          style: Theme.of(context).textTheme.headline,
                          text: 'True ',
                          children: <TextSpan>[
                            new TextSpan(
                              text: 'Code',
                              style: new TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey),
                            ),
                            new TextSpan(
                              text: '\nEffort Reusability',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DefaultTextStyle.merge(
                style: Theme.of(context).textTheme.caption,
                child: ParallaxWidget(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Tomek Polański',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text('@tpolansk'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
