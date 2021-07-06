import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/models/ser_model.dart';

class LoginController {
  final authController = AuthController();

//NECESSARIO TRAZER O CONTEXTO PARA A FUNÇÃO PASSAR PARA O AUTH CONTROLLER O ESTADO DE AUTENTICAÇÃO DO USUARIO
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      final user =
          UserModel(
            name: response!.displayName!, 
            photoUrl: response.photoUrl
          );
      authController.setUser(context, user);
      print(response);
    } catch (e) {
      authController.setUser(context, null);
      print(e);
    }
  }
}
