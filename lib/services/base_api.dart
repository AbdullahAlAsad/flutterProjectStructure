import 'package:finz/services/prefs_services.dart';

abstract class BaseApi {
  final String _authToken = Prefs().getToken();
}
