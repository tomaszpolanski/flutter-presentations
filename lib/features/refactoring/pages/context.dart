import 'package:flutter/material.dart';

class Context extends StatefulWidget {
  const Context({super.key});

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
          const _RebuildDemo(),
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
class _RebuildDemo extends StatelessWidget {
  const _RebuildDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('Rebuilding Whole');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Builder(builder: (context) {
          // ignore: avoid_print
          print('Rebuilding Hi!');
          return Text('Hi! ${MediaQuery.of(context).textScaleFactor}');
        },),
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

// ignore: unused_element
class _RebuildDemoRefactored extends StatelessWidget {
  const _RebuildDemoRefactored({super.key});

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
            return Text('Hi! ${MediaQuery.of(context).textScaleFactor}');
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
    super.key,
    required this.onIncrement,
    required this.onDecrement,
  });

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
