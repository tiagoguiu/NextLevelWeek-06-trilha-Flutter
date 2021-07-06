import 'package:flutter/material.dart';
import 'package:payflow/shared/models/ser_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;
/* 
ESTA CLASSE SERVE PARA VER SE O USUARIO ESTA AUTENTICADO
O QUAL JA COMEÇA COMO FALSE, LOGO NÃO COMEÇA AUTHENTICADO
EXISTE UM METODO GET COM UMA ARROW FUNC PARA RETORNAR O USUARIO
O QUAL É PRIVADO 
*/
  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
//push replacement faz com que o usuario não tenha opção de volta
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    instance.setString("user", user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (instance.containsKey("user")) {
      final json = instance.get("user") as String;
      setUser(context, UserModel.fromJson(json));
      return;
    } else {
      setUser(context, null);
    }
  }
}
