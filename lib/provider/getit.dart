import 'package:finz/features/authentication/application/auth_service.dart';
import 'package:finz/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerFactory(() => AuthService());
  // getIt.registerFactory(() => HomeScreenViewModel());
}
