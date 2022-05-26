import 'package:finz/constants/static_cosntants.dart';
import 'package:finz/services/base_api.dart';
import 'package:finz/services/prefs_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthService extends BaseApi {
  final LocalAuthentication _auth = LocalAuthentication();
  Future<bool> checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      if (kDebugMode) print(e);
    }
    return canCheckBiometrics;
  }

  Future<bool> authenticateWithBiometrics() async {
    return await _auth.authenticate(
      localizedReason:
          'Scan your fingerprint (or face or whatever) to authenticate',
      options: const AuthenticationOptions(
        useErrorDialogs: true,
        stickyAuth: true,
        biometricOnly: true,
      ),
    );
  }

  Future<bool> isAuthenabled() => Prefs().getAuthEnableStatus();
}
