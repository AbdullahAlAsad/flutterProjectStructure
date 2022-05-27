import 'package:finz/features/authentication/application/auth_service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupDependencyInjection() {
  getIt.registerFactory(() => AuthService());
}
