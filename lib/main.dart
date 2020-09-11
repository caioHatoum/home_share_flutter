import 'package:app_test/ui/views/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app_test/services/navigation_service.dart';
import 'package:app_test/services/dialog_service.dart';
import 'managers/dialog_manager.dart';
import 'ui/router.dart';
import 'locator.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';

void main() {
  // Register all the models and services before the app starts
  setupLocator();
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'app_test',
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 9, 202, 172),
        backgroundColor: Color.fromARGB(255, 26, 27, 30),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Open Sans',
            ),
      ),
      home: FutureBuilder(
        future:Firebase.initializeApp(),
        builder: (context,snapshot){
          if (snapshot.hasError) {
            return Text('Houve um erro de inicialização');
          }
          if (snapshot.connectionState==ConnectionState.done) {
            return LoginView();
          }
          return new Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightGreen,
              title: Text('Aguarde seu HomeShare iniciar'),
              ),
            body: Center(
              child: Loading(
                indicator: BallSpinFadeLoaderIndicator(),
                size: 100.00,
                ),
              ),
          );
        },
        ),
      onGenerateRoute: generateRoute,
    );
  }
}
