import 'package:app_test/ui/views/forgot_password_view.dart';
import 'package:app_test/ui/views/history_view.dart';
import 'package:app_test/ui/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:app_test/constants/route_names.dart';
import 'package:app_test/ui/views/login_view.dart';
import 'package:app_test/ui/views/signup_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
    case ForgotPasswordViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ForgotPasswordView(),
      );
    case HistoryViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HistoryView(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
