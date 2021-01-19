import 'package:flutter/material.dart';

class Context extends StatefulWidget {
  const Context({Key? key}) : super(key: key);

  @override
  _ContextState createState() => _ContextState();
}

class _ContextState extends State<Context> {
  double _scaleFactor = 2;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: _scaleFactor),
      child: Stack(
        children: [
          const _AfterText(),
          Positioned(
            bottom: 0,
            right: 0,
            child: _Buttons(
              onIncrement: () {
                setState(() => _scaleFactor += 0.5);
              },
              onDecrement: () {
                setState(() => _scaleFactor -= 0.5);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: unused_element
class _BeforeText extends StatelessWidget {
  const _BeforeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('Rebuilding Whole');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Hi!'),
        Builder(
          builder: (context) {
            // ignore: avoid_print
            print('Rebuilding Really Expensive Widget!');
            return InteractiveViewer(
              child: const SizedBox(),
            );
          },
        ),
      ],
    );
  }
}

class _AfterText extends StatelessWidget {
  const _AfterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('Rebuilding Whole');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Builder(
          builder: (context) {
            // ignore: avoid_print
            print('Rebuilding Text Only');
            return Text('Hii! ${MediaQuery.of(context).textScaleFactor}');
          },
        ),
        Builder(
          builder: (context) {
            // ignore: avoid_print
            print('Rebuilding Really Expensive Widget!');
            return InteractiveViewer(
              child: const SizedBox(),
            );
          },
        ),
      ],
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    Key? key,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          onPressed: onIncrement,
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          onPressed: onDecrement,
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
