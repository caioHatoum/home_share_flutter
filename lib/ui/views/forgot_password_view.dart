import 'package:app_test/ui/shared/ui_helpers.dart';
import 'package:app_test/ui/widgets/busy_button.dart';
import 'package:app_test/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:app_test/viewmodels/forgot_password_view_model.dart';

class ForgotPasswordView extends StatelessWidget {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
      viewModelBuilder: () => ForgotPasswordViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Esqueci minha senha.',
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
            
              verticalSpaceMedium,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BusyButton(
                    title: 'Enviar nova senha.',
                    busy: model.busy,
                    onPressed: () {
                      model.forgotPassword(
                        email: emailController.text,
                       );
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
