import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //criando objeto baseado no FirebaseUser

  //entrar com email e senha

  //registrar com email e senha
  Future createUserWithEmailAndPassword(String email, String password) async{
   try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password
  );

} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('A senha é considerada uma senha FRACA.');
  } else if (e.code == 'email-already-in-use') {
    print('Já existe uma conta para o e-mail dado.');
  }
} catch (e) {
  print(e.toString());
}
  }
 

  //sair
  
}