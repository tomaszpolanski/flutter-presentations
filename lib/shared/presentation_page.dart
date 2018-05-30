import 'package:flutter/material.dart';

class PresentationPage extends StatelessWidget {

  final Widget title;
  final Widget child;

  const PresentationPage({Key key, this.title, this.child}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: new DefaultTextStyle(
          style: Theme.of(context).textTheme.display1.copyWith(
              color: const Color(0xFF6AA84F), fontWeight: FontWeight.bold),
          child: title,
        ),
      ),
      body: child,
    );
  }
}
