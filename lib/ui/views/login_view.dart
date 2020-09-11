import 'package:app_test/constants/route_names.dart';
import 'package:app_test/locator.dart';
import 'package:app_test/services/navigation_service.dart';
import 'package:app_test/ui/shared/ui_helpers.dart';
import 'package:app_test/ui/widgets/busy_button.dart';
import 'package:app_test/ui/widgets/input_field.dart';
import 'package:app_test/ui/widgets/text_link.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:app_test/viewmodels/login_view_model.dart';

class LoginView extends StatelessWidget {

  //controladores dos inputs de email e senha
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 150,
                  child: Image.asset('assets/images/title.png'),
                ),
                InputField(
                  placeholder: 'Email',
                  textInputType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Senha',
                  password: true,
                  controller: passwordController,
                ),
                TextLink('esqueci minha senha.',
                  onPressed: (){
                    _navigationService.navigateTo(ForgotPasswordViewRoute);
                  },
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BusyButton(
                      title: 'Login',
                      busy: model.busy,
                      onPressed: () {
                        model.login(
                          email: emailController.text, 
                          password: passwordController.text);
                      },
                    )
                  ],
                ),
                verticalSpaceMedium,
                TextLink(
                  'Entre na nossa casa.',
                  onPressed: () {
                    _navigationService.navigateTo(SignUpViewRoute);
                  },
                )
              ],
            ),
          )),
    );
  }
}
