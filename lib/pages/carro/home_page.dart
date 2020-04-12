import 'package:carros/drawer_list.dart';
import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carro_listview.dart';
import 'package:carros/pages/carro/carros_api.dart';
import 'package:carros/utils/original.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage>{

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _initTabs();
  }

  _initTabs() async {

    // Primeiro busca o índice nas prefs.
    int tabIdx = await Prefs.getInt("tabIdx");

    // Depois cria o TabController
    // No método build na primeira vez ele poderá estar nulo
    _tabController = TabController(length: 3, vsync: this);

    // Agora que temos o TabController e o índice da tab,
    // chama o setState para redesenhar a tela
    setState(() {
      _tabController.index = tabIdx;
    });

    _tabController.addListener(() {
      Prefs.setInt("tabIdx", _tabController.index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        bottom: _tabController == null
            ? null
            : TabBar(
          controller: _tabController,
          tabs: [
          Tab(
            text: "Classicos",
          ),
          Tab(
            text: "Esportivos",
          ),
          Tab(
            text: "Luxo",
          ),
        ]),
      ),
      body: _tabController == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          :TabBarView(
        controller: _tabController,
        children: [
        CarroListView(Tipo.classicos),
        CarroListView(Tipo.esportivos),
        CarroListView(Tipo.luxo),
      ]),
      drawer: DrawerList(),
    );
  }
}
