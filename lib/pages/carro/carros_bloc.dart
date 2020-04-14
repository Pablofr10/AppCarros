import 'dart:async';

import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carros_api.dart';
import 'package:carros/pages/carro/simple_bloc.dart';

class CarroBloc extends SimpleBloc<List<Carro>>{

  final _streamController = StreamController<List<Carro>>();

  Stream<List<Carro>> get stream => _streamController.stream;


  fetch(String tipo) async {

    try {
      List<Carro> carros = await CarrosApi.getCarros(tipo);

      add(carros);
      
    } catch (e) {
      addError(e);
    }

  }

  
}