import 'package:app_test/services/authentication_service.dart';
import 'package:app_test/services/dialog_service.dart';
import 'package:app_test/services/navigation_service.dart';
import 'package:app_test/locator.dart';
import 'package:app_test/constants/route_names.dart';
import 'base_model.dart';
class HomeViewModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  Future signOut() async{
    setBusy(true);
    var result = await _authenticationService.signOut().then((value) => true);
    setBusy(false);
    if (result) {
       return await _navigationService.navigateTo(LoginViewRoute);
      }else{
        return await _dialogService.showDialog(
          title: 'Falha ao sair do HomeShare',
          description: 'Um erro ocorreu, tente novamente em alguns instantes.'
        );
      }
    }
  }
