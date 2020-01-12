import 'dart:async';

class CounterBloc {
  int _counter = 0;

  final _counterStreamController = StreamController<int>();
  // StreamSink<int> get counterSink => _counterStreamController.sink;
  Stream<int> get counterStream => _counterStreamController.stream;

  addCount(i) {
    _counter += i;
    _counterStreamController.sink.add(_counter);
  }

  dispose() { 
    _counterStreamController.close();
  }
  
}