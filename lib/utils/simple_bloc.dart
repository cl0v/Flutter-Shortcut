import 'dart:async';


/// Easy utility for using streams
class SimpleBloc<T> {
  final _controller = StreamController<T>();
  Stream<T> get stream => _controller.stream;

  add(T obj) {
    if (!_controller.isClosed) {
      _controller.add(obj);
    }
  }

  subscribe(Stream<T> s) {
    if (!_controller.isClosed) {
      s.listen((v) => add(v));
    }
  }

  addError(Object obj) {
    if (!_controller.isClosed) {
      _controller.addError(obj);
    }
  }

  dispose() {
    _controller.close();
  }
}