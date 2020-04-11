import 'package:carros/pages/login_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Lucas"), 
              accountEmail: Text("pablo@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://i0.wp.com/pipocamoderna.com.br/wp-content/uploads/2019/06/pose1-800x734.jpg"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Favoritos");
                Navigator.pop(context);
              }
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Ajuda");
                Navigator.pop(context);
              }
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              onTap: () => _onClickLogOut(context),
            ),
          ],
          ),
      ),
    );
  }

  _onClickLogOut(BuildContext context) {
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }

}