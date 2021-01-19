import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Architecture extends StatelessWidget {
  const Architecture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const AfterCounterView(),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}

class BeforeCounterView extends StatelessWidget {
  const BeforeCounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text('$state');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class AfterCounterView extends StatelessWidget {
  const AfterCounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleCounterView(
      onIncrement: () => BlocProvider.of<CounterCubit>(context).increment(),
      onDecrement: () => BlocProvider.of<CounterCubit>(context).decrement(),
      child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Text('$state');
        },
      ),
    );
  }
}

class SimpleCounterView extends StatelessWidget {
  const SimpleCounterView({
    Key? key,
    required this.child,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: child,
      ),
      floatingActionButton: Column(
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
      ),
    );
  }
}
