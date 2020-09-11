import 'package:app_test/ui/shared/ui_helpers.dart';
import 'package:app_test/ui/widgets/busy_button.dart';
import 'package:app_test/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:app_test/viewmodels/signup_view_model.dart';

class SignUpView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Cadastrar',
                style: TextStyle(
                  fontSize: 38,
                ),
              ),
              verticalSpaceLarge,
              // TODO: Add additional user data here to save (episode 2)
              InputField(
                placeholder: 'Email',
                controller: emailController,
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Senha',
                password: true,
                controller: passwordController,
                additionalNote: 'Senha precisa conter no minimo 6 caracteres',
              ),
              verticalSpaceMedium,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BusyButton(
                    title: 'Sign Up',
                    busy: model.busy,
                    onPressed: () {
                      model.signUp(
                        email: emailController.text,
                        password: passwordController.text);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
