import 'package:carros/widgets/app_button.dart';
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

  @override
  void initState(){
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
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _textForm("Login", "Digite seu login",
                controller: _tLogin,
                validator: _validarLogin,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                nextFocus: _focusSenha,
                ),
            SizedBox(
              height: 20,
            ),
            _textForm("Senha", "Digite sua senha",
                controller: _tSenha,
                password: true,
                validator: _validarSenha,
                keyboardType: TextInputType.number,
                focusNode: _focusSenha
              ),
            SizedBox(
              height: 20,
            ),
            AppButton(
              "Login", 
              onPressed: _onClickLogin
              ,),
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
      }) {
    
  }

 
  _onClickLogin() {
    String login = _tLogin.text;
    String senha = _tSenha.text;

    bool formOk = _formKey.currentState.validate();

    if (formOk) {
      print("Login:, $login, Senha: $senha");
    }
  }

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
