import 'package:app_test/services/authentication_service.dart';
import 'package:get_it/get_it.dart';
import 'package:app_test/services/navigation_service.dart';
import 'package:app_test/services/dialog_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
}
