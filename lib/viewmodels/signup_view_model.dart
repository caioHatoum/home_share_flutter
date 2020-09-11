import 'package:app_test/services/authentication_service.dart';
import 'package:app_test/services/dialog_service.dart';
import 'package:app_test/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:app_test/locator.dart';
import 'package:app_test/constants/route_names.dart';
import 'base_model.dart';
class SignUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  Future signUp({
    @required String email,
    @required String password,
  }) async{
    setBusy(true);
    var result = await _authenticationService.siginUpWithEmail(email: email, password: password);
    setBusy(false);
    if (result is bool) {
      if(result){
       return await _navigationService.navigateTo(HomeViewRoute);
      }else{
        return await _dialogService.showDialog(
          title: 'Falha ao iniciar HomeShare',
          description: 'Um erro ocorreu, tente novamente em alguns instantes.'
        );
      }
    }else{
      return await _dialogService.showDialog(
        title: 'Falha ao iniciar HomeShare',
        description: result,
      );
    }
  }
}