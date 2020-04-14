import 'dart:async';

import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carro_page.dart';
import 'package:carros/pages/carro/carros_api.dart';
import 'package:carros/pages/carro/carros_model.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CarroListView extends StatefulWidget {
  
  String tipo;
  CarroListView(this.tipo);

  @override
  _CarroListViewState createState() => _CarroListViewState();
}

class _CarroListViewState extends State<CarroListView> with AutomaticKeepAliveClientMixin<CarroListView>{
  @override
  bool get wantKeepAlive => true;
  List<Carro> carros;

  String get tipo => widget.tipo;

  final _model = CarrosModel();


  @override
  void initState() {
    super.initState();

    _fetch();
  }

  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return Observer(
      builder: (context) {
        List<Carro> carros = _model.carros;

        if (_model.error != null) {
          return TextErrror("Ocorreu um erro ao buscar os carros \n Clique aqui para atualizar", onPressed: _fetch,);
        }

        if (carros == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return _listaCarros(carros);
      },
    );

    //return _listaCarros(carros);
  }

  _listaCarros(List<Carro> carros) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: carros.length,
          itemBuilder: (BuildContext context, int index) {
            Carro c = carros[index];

            return Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              child: Card(
                color: Colors.grey[200],
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Image.network(
                          c.urlFoto ?? "http://www.livroandroid.com.br/livro/carros/classicos/Chevrolet_BelAir.png",
                          width: 250,
                        ),
                      ),
                      Text(
                        c.nome ?? "oi",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        "Descrição",
                        style: TextStyle(fontSize: 14),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('DETALHES'),
                            onPressed: () => _onClickCarro(c),
                          ),
                          FlatButton(
                            child: const Text('SHARE'),
                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  _onClickCarro(Carro c) {
    push(context, CarroPage(c));
  }

  _fetch() {
    _model.fetch(tipo);
  }
}