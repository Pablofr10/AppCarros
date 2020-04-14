import 'dart:async';

class SimpleBloc<T> {

  final _controller = StreamController();

  Stream<T> get stream => _controller.stream;

  void add(T objeto){
    _controller.add(objeto);
  }

  void addError(Object error){
    if (! _controller.isClosed) {
      _controller.addError(error);    
    }
  }  

  void dispose() {
    _controller.close();
  }  

}

class BooleanBloc extends SimpleBloc<bool> {
    
}