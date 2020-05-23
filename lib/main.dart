import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      // Step 3: Instantiate Bloc class
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(), //instantiate class
        child: CounterPage(), //call build page
      ),
    );
  }
}

// Step 4: UI
class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Step 4.1: Get bloc from Provider
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      // Step 4.2: Use BlocBuilder to build UI using bloc
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 24.0),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              // Step 4.3: Add event to bloc to process and change state.
              onPressed: () {
                counterBloc.add(CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                counterBloc.add(CounterEvent.decrement);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Step 1: Create events
enum CounterEvent {increment, decrement}

// Step 2: Create bloc
class CounterBloc extends Bloc<CounterEvent, int> {
  // Step 2.1: Define initial state
  @override
  int get initialState => 0;

  // Step 2.2: Handle events
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
      default:
        throw Exception('invalid event');
    }
  }
}
