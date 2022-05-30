import 'dart:async';

class MyBloc {
  final StreamController<int> _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  Sink<int> get sink => _controller.sink;

  int counter = 0;

  void increment(){
    _controller.sink.add(counter++);
  }
}