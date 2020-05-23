This flutter app is demonstrates BLoC library and Flutter_Bloc library. It shows very simple example of counter app implemented using bloc state architecture pattern.

The workflow of the Counter App:
- add packages
- create events as enum.
- create state - in this app, state is `int` so we don't create state class.
- create bloc to take events, map it, and return state, 
  - `class CounterBloc extends Bloc<CounterEvent, int> {...}`
  - here override init state
  - and override mapEventsToState
- instantiate bloc in main using `BlocProvider<Bloc>{}`. 
- create Page, get bloc, 
- get bloc, `final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);`
- body will be `BlocBuilder<CounterBloc, int>();` to build UI based on state.
- action event, `onPressed: () {counterBloc.add(CounterEvent.increment);}`

This development was based on [this](https://bloclibrary.dev/#/fluttercountertutorial?id=counter-app) tutorial.

Thank you.