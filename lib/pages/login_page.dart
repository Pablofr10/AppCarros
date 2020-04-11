import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/home_page.dart';
import 'package:carros/pages/login_api.dart';
import 'package:carros/pages/usuario.dart';
import 'package:carros/utils/alert.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _focusSenha = FocusNode();

  bool _showProgress = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: _showProgress
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.all(16),
              child: ListView(
                children: <Widget>[
                  AppText(
                    "Login",
                    "Digite seu login",
                    controller: _tLogin,
                    validator: _validarLogin,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    nextFocus: _focusSenha,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppText("Senha", "Digite sua senha",
                      controller: _tSenha,
                      password: true,
                      validator: _validarSenha,
                      keyboardType: TextInputType.number,
                      focusNode: _focusSenha),
                  SizedBox(
                    height: 20,
                  ),
                  AppButton(
                    "Login",
                    onPressed: _onClickLogin,
                  ),
                ],
              ),
            ),
    );
  }

  _textForm(
    String label,
    String hint, {
    bool password = false,
    TextEditingController controller,
    FormFieldValidator<String> validator,
    TextInputType keyboardType,
    TextInputAction textInputAction,
    FocusNode focusNode,
    FocusNode nextFocus,
  }) {}

  _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    setState(() {
      _showProgress = true;
    });

    ApiResponse response = await LoginApi.login(login, senha);

    if (response.ok) {
      Usuario user = response.result;
      print(">>> $user");
      push(context, HomePage(), replace: true);
    } else {
      print(response.msg);
      alert(context, response.msg);
    }

    setState(() {
      _showProgress = false;
    });
  }

  mudarEstado() {}

  String _validarLogin(String text) {
    if (text.isEmpty) {
      return "Digite o Login";
    }
    return null;
  }

  String _validarSenha(String text) {
    if (text.isEmpty) {
      return "Digite o Senha";
    }
    if (text.length < 3) {
      return "A senha precisa ter no mínino 6 números";
    }
    return null;
  }
}
