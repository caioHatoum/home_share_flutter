import 'package:app_test/constants/route_names.dart';
import 'package:app_test/locator.dart';
import 'package:app_test/services/dialog_service.dart';
import 'package:app_test/services/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future loginWithEmail({
    @required String email,
    @required String password,
    })async{
      try {
        var user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, 
          password: password);
        return user != null;

      } catch (e) {
        return e.message;
      }
  }
  Future siginUpWithEmail({
    @required String email,
    @required String password,
    }) async{

      try {
        var authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
        await authResult.user.sendEmailVerification();
        if(!authResult.user.emailVerified){
          return _dialogService.showDialog(
            title: 'Verifique seu e-mail', 
            description: 'Um email de confirmação foi enviado para '+email+', ative sua conta.',
            buttonTitle: 'Ok').then((value) => _navigationService.navigateTo(LoginViewRoute));
          }else{
            return authResult.user != null;
          }
      } catch (e) {
        return e.message;
      }

    return null;
  }

  Future forgotPassword({
    @required String email
  }) async{
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      
      return _dialogService.showDialog(
        title: 'Solicitação realizada com sucesso!',
        description: 'um email com uma nova senha será enviada para o email, '+email+', apenas caso seja um email cadastrado',
        buttonTitle: 'Ok',
        ).then( (value)=> _navigationService.navigateTo(LoginViewRoute) );
    } catch (e) {
      return e.message;
    }
  }
}