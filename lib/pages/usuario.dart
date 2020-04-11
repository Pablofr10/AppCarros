class Usuario{
  String login;
  String nome;
  String email;
  String token;

  List<String> roles;

  Usuario.fromJson(Map<String, dynamic> map){
    nome = map["nome"];
    email = map["email"];
    login = map["login"];
    token = map["token"];
    roles = map["roles"] != null ? map["roles"].cast<String>() : null;
  }

  @override
  String toString() {
    return 'Usuário{login: $login, nome: $nome, email: $email, token: $token, roles: $roles}';
  }
}