import 'package:app_test/services/authentication_service.dart';
import 'package:app_test/services/dialog_service.dart';
import 'package:app_test/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:app_test/constants/route_names.dart';

import '../locator.dart';
import 'base_model.dart';
class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  Future login({
    @required String email,
    @required String password,
  }) async{
    setBusy(true);
    var result = await _authenticationService.loginWithEmail(email: email, password: password);
    setBusy(false);
    if (result is bool) {
      if(result){
        await _navigationService.navigateTo(HomeViewRoute);
      }else{
        await _dialogService.showDialog(
          title: 'Falha ao logar HomeShare',
          description: 'Um erro de login ocorreu, tente novamente em alguns instantes.'
        );
      }
    }else{
      await _dialogService.showDialog(
        title: 'Falha ao iniciar HomeShare',
        description: result,
      );
    }
  }
}